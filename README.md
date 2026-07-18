# tune_mac — Make Your Mac Ultra Fast ⚡

One-liner. Zero install. Reversible anytime.

### Apply (speed up)
```bash
curl -fsSL https://raw.githubusercontent.com/febritecno/tune_mac/main/tune_mac.sh | bash
```

### Restore (back to macOS defaults)
```bash
curl -fsSL https://raw.githubusercontent.com/febritecno/tune_mac/main/tune_mac.sh | bash -s -- --restore
```

---

## What This Script Does in 1 Second

This script eliminates visual overhead and non-essential background processes on your macOS, delivering real GPU/CPU power savings (especially noticeable on Apple Silicon M1/M2/M3 chips):

**🔍 Spotlight Turbo Mode**
Stops heavy indexing of documents, photos, and email. Makes Spotlight super lightweight by searching Applications only.

**⚡ Zero-Delay UI**
Completely disables window animations, motion effects, transparency, and makes Dock and Notification Center respond instantly.

**🎨 GPU Rendering Optimization**
Removes heavy visual effects like window blur, smooth scrolling, and rubber-band bounce to reduce WindowServer workload.

**📡 Background Silent Mode**
Disables background Bluetooth/Radio scanning for Handoff and AirDrop that quietly drain CPU.

**🗑️ Cache Garbage Collector**
Cleans stale, accumulating user cache files without disturbing files actively in use by the system.

---

## Usage

```bash
source tune_mac.sh
tune_mac            # apply
tune_mac restore    # revert to macOS defaults
```

Full log: `~/Library/Logs/tune_mac_*.log`