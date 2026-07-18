# tune_mac — Haz que tu Mac sea ultrarrápida ⚡

[English](./README.md) | [Bahasa Indonesia](./README.id.md) | [Español](./README.es.md) | [Français](./README.fr.md) | [Deutsch](./README.de.md) | [日本語](./README.ja.md) | [中文](./README.zh.md)

Una línea. Sin instalación. Reversible en cualquier momento.

### Aplicar (acelerar)
```bash
curl -fsSL https://raw.githubusercontent.com/febritecno/tune_mac/main/tune_mac.sh | bash
```

### Restaurar (volver a los valores predeterminados de macOS)
```bash
curl -fsSL https://raw.githubusercontent.com/febritecno/tune_mac/main/tune_mac.sh | bash -s -- --restore
```

---

## Qué hace este script en 1 segundo

Este script elimina la sobrecarga visual y los procesos en segundo plano no esenciales de tu macOS, ofreciendo ahorros reales de energía de GPU/CPU (especialmente notable en chips Apple Silicon M1/M2/M3):

**🔍 Modo Turbo Spotlight**
Detena la indexación pesada de documentos, fotos y correo. Hace que Spotlight sea muy ligero al buscar solo Aplicaciones.

**⚡ IU Sin Retardo**
Desactiva completamente las animaciones de ventanas, efectos de movimiento, transparencia y hace que el Dock y el Centro de Notificaciones respondan al instante.

**🎨 Optimización de Renderizado GPU**
Elimina efectos visuales pesados como el desenfoque de ventanas, desplazamiento suave y rebote elástico para reducir la carga de WindowServer.

**📡 Modo Silencioso en Segundo Plano**
Desactiva el escaneo en segundo plano de Bluetooth/Radio para Handoff y AirDrop que silenciosamente consumen CPU.

**🗑️ Recolector de Basura de Caché**
Limpia los archivos de caché de usuario obsoletos y acumulados sin alterar los archivos que el sistema está usando activamente.

---

## Uso

```bash
source tune_mac.sh
tune_mac            # aplicar
tune_mac restore    # revertir a los valores predeterminados de macOS
```

Registro completo: `~/Library/Logs/tune_mac_*.log`