# tune_mac

> **make your Mac ultra fast** — Spotlight trim, cache sweep, animation kill.

One function. Three optimizations. Zero install.

## One-liner

```bash
curl -fsSL https://raw.githubusercontent.com/febritecno/tune_mac/main/tune_mac.sh | bash -s -- --apply
```

To revert everything back to macOS defaults:

```bash
curl -fsSL https://raw.githubusercontent.com/febritecno/tune_mac/main/tune_mac.sh | bash -s -- --restore
```

## What it does

| # | Area | Effect |
|---|------|--------|
| 1 | **Spotlight** | Only "Applications" indexed. Web/Siri suggestions off. |
| 2 | **Caches** | Stale user caches cleared (skips files in use). |
| 3 | **Animations** | Dock, Finder, Mission Control, Safari, window server, Handoff, AirDrop — all trimmed or disabled. |

## Manual usage

```bash
source tune_mac.sh
tune_mac       # apply
tune_mac restore  # revert
```

Everything is logged to `~/Library/Logs/tune_mac_*.log`.
