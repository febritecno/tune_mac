# tune_mac — Mach deinen Mac ultraschnell ⚡

[English](./README.md) | [Bahasa Indonesia](./README.id.md) | [Español](./README.es.md) | [Français](./README.fr.md) | [Deutsch](./README.de.md) | [日本語](./README.ja.md) | [中文](./README.zh.md)

Einzeilig. Keine Installation. Jederzeit umkehrbar.

### Anwenden (beschleunigen)
```bash
curl -fsSL https://raw.githubusercontent.com/febritecno/tune_mac/main/tune_mac.sh | bash
```

### Wiederherstellen (zurück zu macOS-Standardeinstellungen)
```bash
curl -fsSL https://raw.githubusercontent.com/febritecno/tune_mac/main/tune_mac.sh | bash -s -- --restore
```

---

## Was dieses Skript in 1 Sekunde tut

Dieses Skript beseitigt visuellen Overhead und unwichtige Hintergrundprozesse auf deinem macOS und liefert echte GPU/CPU-Energieeinsparungen (besonders spürbar bei Apple Silicon M1/M2/M3-Chips):

**🔍 Spotlight Turbo-Modus**
Stoppt das schwere Indizieren von Dokumenten, Fotos und E-Mails. Macht Spotlight super leichtgewichtig, indem nur nach Anwendungen gesucht wird.

**⚡ Zero-Delay UI**
Deaktiviert Fensteranimationen, Bewegungseffekte und Transparenz vollständig und sorgt dafür, dass Dock und Mitteilungszentrum sofort reagieren.

**🎨 GPU-Rendering-Optimierung**
Entfernt schwere visuelle Effekte wie Fensterunschärfe, sanftes Scrollen und Gummi-Band-Abprallen, um die WindowServer-Last zu verringern.

**📡 Hintergrund-Stiller Modus**
Deaktiviert Hintergrund-Bluetooth/Funk-Scans für Handoff und AirDrop, die unbemerkt CPU verbrauchen.

**🗑️ Cache-Müllsammler**
Bereinigt veraltete, sich ansammelnde Benutzer-Cache-Dateien, ohne Dateien zu stören, die vom System aktiv verwendet werden.

---

## Verwendung

```bash
source tune_mac.sh
tune_mac            # anwenden
tune_mac restore    # auf macOS-Standardeinstellungen zurücksetzen
```

Vollständiges Protokoll: `~/Library/Logs/tune_mac_*.log`