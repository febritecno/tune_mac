# tune_mac — Make Your Mac Ultra Fast ⚡

One-liner. Zero install. Pulihkan kapan saja.

```bash
curl -fsSL https://raw.githubusercontent.com/febritecno/tune_mac/main/tune_mac.sh | bash
curl -fsSL https://raw.githubusercontent.com/febritecno/tune_mac/main/tune_mac.sh | bash -s -- --restore
```

---

## Apa yang Dilakukan Script Ini dalam 1 Detik?

Script ini mengeliminasi overhead visual dan proses background yang tidak krusial di macOS Anda, memberikan penghematan daya GPU/CPU yang nyata (sangat terasa di chip Apple Silicon M1/M2/M3):

**🔍 Spotlight Turbo Mode**
Menghentikan proses indexing dokumen, foto, dan email yang berat. Menjadikan Spotlight super ringan karena hanya mencari Aplikasi saja.

**⚡ Zero-Delay UI**
Mematikan total animasi window, efek gerak (motion), transparency, serta mempercepat respon munculnya Dock dan Notification Center menjadi instan.

**🎨 GPU Rendering Optimization**
Menghapus efek visual berat seperti window blur, efek smooth scrolling, dan rubber-band bounce untuk meringankan beban kerja WindowServer.

**📡 Background Silent Mode**
Mematikan scanning Bluetooth/Radio di background untuk Handoff dan AirDrop yang sering kali diam-diam memakan daya CPU.

**🗑️ Cache Garbage Collector**
Membersihkan file cache user yang usang dan menumpuk tanpa mengganggu file yang sedang aktif digunakan oleh sistem.

---

## Cara Pakai

```bash
source tune_mac.sh
tune_mac            # apply
tune_mac restore    # revert ke default macOS
```

Log lengkap: `~/Library/Logs/tune_mac_*.log`