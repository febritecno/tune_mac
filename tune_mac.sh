#!/usr/bin/env bash
#
# tune_mac() — all-in-one Mac speed tune-up:
#   1. Spotlight: only "Applications" indexed/searchable, everything else off
#   2. Clear stale caches (safe — skips files currently in use)
#   3. Reduce/disable animations + advanced background & rendering chatter
#
# Usage:
#   source tune_mac.sh
#   tune_mac              # apply everything
#   tune_mac restore      # revert everything back to macOS defaults

function tune_mac {
    local RESTORE=false
    [[ "${1:-}" == "restore" ]] && RESTORE=true

    local LOG="$HOME/Library/Logs/tune_mac_$(date +%Y%m%d_%H%M%S).log"
    echo "Log: $LOG"

    # ── Spinner (background PID + message) ────────────────────────
    local _spin='-\|/'
    _spinner() {
        local pid=$!
        local msg="$1" i=0
        printf "  %s  " "$msg"
        while kill -0 $pid 2>/dev/null; do
            printf "\b%c" "${_spin:$i:1}"
            i=$(( (i+1) % 4 ))
            sleep 0.08
        done
        wait $pid 2>/dev/null
        printf "\b✓\n"
    }
    # ASCII banner
    _header() {
        printf "\n"
        printf "  ╔══════════════════════════════════════╗\n"
        printf "  ║       ⚡  tune_mac  —  Speed Up  ⚡   ║\n"
        printf "  ╚══════════════════════════════════════╝\n"
        printf "\n"
    }

    # =====================================================================
    # RESTORE PATH
    # =====================================================================
    if $RESTORE; then
        echo "=== Restoring Spotlight to default (all categories on) ===" | tee -a "$LOG"
        local SPOTLIGHT_PLIST="$HOME/Library/Preferences/com.apple.spotlight.plist"
        python3 - "$SPOTLIGHT_PLIST" <<'PYEOF' 2>>"$LOG"
import plistlib, sys, os
path = sys.argv[1]
categories = [
    "APPLICATIONS","SYSTEM_PREFS","DOCUMENTS","DIRECTORIES","PDF","IMAGES",
    "MOVIES","MUSIC","MESSAGES","MAIL","CONTACT","EVENT_TODO","BOOKMARKS",
    "FONT","PRESENTATIONS","SPREADSHEETS","SOURCE","TIPS",
    "MENU_EXPRESSION","MENU_CONVERSION","MENU_DEFINITION",
    "MENU_SPOTLIGHT_SUGGESTIONS","MENU_WEBSEARCH",
]
data = {}
if os.path.exists(path):
    with open(path, "rb") as f:
        data = plistlib.load(f)
items = data.get("orderedItems", [])
existing = {i.get("name"): i for i in items}
for name in categories:
    if name in existing:
        existing[name]["enabled"] = 1
    else:
        items.append({"name": name, "enabled": 1})
data["orderedItems"] = items
with open(path, "wb") as f:
    plistlib.dump(data, f)
print("Spotlight restored: all categories enabled")
PYEOF
        defaults write com.apple.lookup.shared LookupSuggestionsDisabled -bool false
        defaults write com.apple.Spotlight SuggestionsDisabled -bool false
        sudo mdutil -i on / >>"$LOG" 2>&1

        echo "=== Restoring animation/UI defaults ===" | tee -a "$LOG"
        defaults delete com.apple.universalaccess reduceTransparency 2>/dev/null
        defaults delete com.apple.universalaccess reduceMotion 2>/dev/null
        defaults delete com.apple.dock launchanim 2>/dev/null
        defaults delete com.apple.dock autohide-time-modifier 2>/dev/null
        defaults delete com.apple.dock autohide-delay 2>/dev/null
        defaults delete com.apple.dock expose-animation-duration 2>/dev/null
        defaults delete com.apple.dock workspaces-swoosh-animation-off 2>/dev/null
        defaults delete com.apple.dock mineffect 2>/dev/null
        defaults delete com.apple.dock expose-group-apps 2>/dev/null
        defaults delete com.apple.finder DisableAllAnimations 2>/dev/null
        defaults delete NSGlobalDomain QLPanelAnimationDuration 2>/dev/null
        defaults delete NSGlobalDomain NSWindowResizeTime 2>/dev/null
        defaults delete NSGlobalDomain NSAutomaticWindowAnimationsEnabled 2>/dev/null
        defaults delete NSGlobalDomain NSWindowSupportsAutomaticInlineTitle 2>/dev/null
        defaults delete NSGlobalDomain NSUseAnimatedFocusRing 2>/dev/null
        defaults delete NSGlobalDomain NSScrollAnimationEnabled 2>/dev/null
        defaults delete NSGlobalDomain NSScrollViewRubberBanding 2>/dev/null
        defaults delete NSGlobalDomain AppleShowScrollBars 2>/dev/null
        defaults delete NSGlobalDomain AppleFontSmoothing 2>/dev/null
        defaults delete com.apple.notificationcenterui bannerTime 2>/dev/null
        defaults delete com.apple.WindowManager EnableStandardClickToShowDesktop 2>/dev/null
        defaults delete com.apple.NetworkBrowser DisableAirDrop 2>/dev/null
        defaults delete com.apple.Safari WebKitInitialTimedLayoutDelay 2>/dev/null
        defaults delete com.apple.Safari IncludeInternalDebugMenu 2>/dev/null
        defaults -currentHost delete com.apple.coreservices.useractivityd ActivityAdvertisingAllowed 2>/dev/null
        defaults -currentHost delete com.apple.coreservices.useractivityd ActivityReceivingAllowed 2>/dev/null

        killall cfprefsd Dock Finder SystemUIServer NotificationCenter Spotlight Safari 2>/dev/null

        echo "Done. Spotlight, cache behavior, and animations all reverted to default."
        return 0
    fi

    # =====================================================================
    # APPLY PATH
    # =====================================================================

    _header

    # --- 1. Spotlight: Applications only ------------------------------------
    (
    local SPOTLIGHT_PLIST="$HOME/Library/Preferences/com.apple.spotlight.plist"
    local SPOTLIGHT_BACKUP="$HOME/Library/Preferences/com.apple.spotlight.plist.bak_$(date +%Y%m%d_%H%M%S)"
    [[ -f "$SPOTLIGHT_PLIST" ]] && cp "$SPOTLIGHT_PLIST" "$SPOTLIGHT_BACKUP"

    python3 - "$SPOTLIGHT_PLIST" <<'PYEOF' 2>>"$LOG"
import plistlib, sys, os
path = sys.argv[1]
keep_on = {"APPLICATIONS"}
all_categories = [
    "APPLICATIONS","SYSTEM_PREFS","DOCUMENTS","DIRECTORIES","PDF","IMAGES",
    "MOVIES","MUSIC","MESSAGES","MAIL","CONTACT","EVENT_TODO","BOOKMARKS",
    "FONT","PRESENTATIONS","SPREADSHEETS","SOURCE","TIPS",
    "MENU_EXPRESSION","MENU_CONVERSION","MENU_DEFINITION",
    "MENU_SPOTLIGHT_SUGGESTIONS","MENU_WEBSEARCH",
]
data = {}
if os.path.exists(path):
    with open(path, "rb") as f:
        data = plistlib.load(f)
items = data.get("orderedItems", [])
existing = {i.get("name"): i for i in items}
for name in all_categories:
    enabled = 1 if name in keep_on else 0
    if name in existing:
        existing[name]["enabled"] = enabled
    else:
        items.append({"name": name, "enabled": enabled})
data["orderedItems"] = items
with open(path, "wb") as f:
    plistlib.dump(data, f)
print("Spotlight set to Applications-only")
PYEOF

    defaults write com.apple.lookup.shared LookupSuggestionsDisabled -bool true
    defaults write com.apple.Spotlight SuggestionsDisabled -bool true

    local idx_status
    idx_status=$(mdutil -s / 2>&1)
    if echo "$idx_status" | grep -qi "disabled"; then
        sudo mdutil -i on / >>"$LOG" 2>&1
        sudo mdutil -E / >>"$LOG" 2>&1
    fi
    ) & _spinner "[1/3] Spotlight: indexing Applications only"

    # --- 2. Clear stale caches -----------------------------------------------
    (
    find "$HOME/Library/Caches" -mindepth 1 -maxdepth 1 -print0 2>/dev/null | \
        while IFS= read -r -d '' d; do
            lsof +D "$d" >/dev/null 2>&1 || rm -rf "$d"
        done
    ) & _spinner "[2/3] Clearing stale caches"

    # --- 3. Animation / UI speed tweaks --------------------------------------
    (
    defaults write com.apple.universalaccess reduceTransparency -bool true
    defaults write com.apple.universalaccess reduceMotion -bool true
    defaults write com.apple.dock launchanim -bool false
    defaults write com.apple.dock autohide-time-modifier -float 0
    defaults write com.apple.dock autohide-delay -float 0
    defaults write com.apple.dock expose-animation-duration -float 0.1
    defaults write com.apple.dock workspaces-swoosh-animation-off -bool true
    defaults write com.apple.dock mineffect -string "scale"
    defaults write com.apple.dock expose-group-apps -bool true
    defaults write com.apple.finder DisableAllAnimations -bool true
    defaults write NSGlobalDomain QLPanelAnimationDuration -float 0
    defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
    defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
    defaults write NSGlobalDomain NSWindowSupportsAutomaticInlineTitle -bool false
    defaults write NSGlobalDomain NSUseAnimatedFocusRing -bool false
    defaults write NSGlobalDomain NSScrollAnimationEnabled -bool false
    defaults write NSGlobalDomain NSScrollViewRubberBanding -int 0
    defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
    defaults write NSGlobalDomain AppleFontSmoothing -int 0
    defaults write com.apple.notificationcenterui bannerTime -int 3
    defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false
    defaults write com.apple.Safari WebKitInitialTimedLayoutDelay -float 0
    defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
    defaults -currentHost write com.apple.coreservices.useractivityd ActivityAdvertisingAllowed -bool false
    defaults -currentHost write com.apple.coreservices.useractivityd ActivityReceivingAllowed -bool false
    defaults write com.apple.NetworkBrowser DisableAirDrop -bool true
    killall cfprefsd Dock Finder SystemUIServer NotificationCenter Spotlight Safari 2>/dev/null
    ) & _spinner "[3/3] Animation & UI optimizations"

    printf "\n  ╔══════════════════════════════════════╗\n"
    printf "  ║     ✓  tune_mac  complete!           ║\n"
    printf "  ╚══════════════════════════════════════╝\n"
    printf "\n"
    printf "  • Spotlight: Applications only\n"
    printf "  • Caches: stale data cleared\n"
    printf "  • Animations: disabled\n"
    printf "\n"
    printf "  Run  tune_mac restore  to revert.\n"
    printf "  Log: %s\n" "$LOG"
}

# Auto-execute when piped (not sourced)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    case "${1:-}" in
    --apply|apply|"") tune_mac ;;
    --restore|restore) tune_mac restore ;;
    *) echo "Usage: source tune_mac.sh && tune_mac [restore]" >&2; exit 1 ;;
    esac
fi
