# tune_mac — Buat Mac Kamu Super Cepat ⚡

[English](./README.md) | [Bahasa Indonesia](./README.id.md) | [Español](./README.es.md) | [Français](./README.fr.md) | [Deutsch](./README.de.md) | [日本語](./README.ja.md) | [中文](./README.zh.md)

One-liner. Tanpa install. Bisa dikembalikan kapan saja.

### Apply (speed up)
```bash
curl -fsSL https://raw.githubusercontent.com/febritecno/tune_mac/main/tune_mac.sh | bash
```

### Restore (kembali ke default macOS)
```bash
curl -fsSL https://raw.githubusercontent.com/febritecno/tune_mac/main/tune_mac.sh | bash -s -- --restore
```

---

## Apa yang Dilakukan Script Ini dalam 1 Detik

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
tune_mac restore    # kembalikan ke default macOS
```

Log lengkap: `~/Library/Logs/tune_mac_*.log`