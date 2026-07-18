# Tune MAC | Speed up your mac

Spotlight → Applications only. Caches → stale ones cleared. Animations → off.
Accessibility → reduce transparency, increase contrast, reduce motion.

```
curl -fsSL https://raw.githubusercontent.com/febritecno/tune_mac/main/tune_mac.sh | bash
curl -fsSL https://raw.githubusercontent.com/febritecno/tune_mac/main/tune_mac.sh | bash -s -- --restore
```

## What

| # | What | Effect |
|---|------|--------|
| 1 | Spotlight | Only Applications indexed. Web/Siri suggestions off. |
| 2 | Caches | Stale `~/Library/Caches` cleared (skips in-use). |
| 3 | Display | Animations off. Transparency reduced. Contrast increased. Motion reduced. |
| 4 | Network | Handoff, AirDrop, and advertising disabled. |

## Usage

```bash
source tune_mac.sh
tune_mac            # apply
tune_mac restore    # revert
```

Log: `~/Library/Logs/tune_mac_*.log`
