# tune_mac — rendez votre Mac ultra rapide ⚡

[English](./README.md) | [Bahasa Indonesia](./README.id.md) | [Español](./README.es.md) | [Français](./README.fr.md) | [Deutsch](./README.de.md) | [日本語](./README.ja.md) | [中文](./README.zh.md)

Une seule ligne. Aucune installation. Réversible à tout moment.

### Appliquer (accélérer)
```bash
curl -fsSL https://raw.githubusercontent.com/febritecno/tune_mac/main/tune_mac.sh | bash
```

### Restaurer (revenir aux valeurs par défaut de macOS)
```bash
curl -fsSL https://raw.githubusercontent.com/febritecno/tune_mac/main/tune_mac.sh | bash -s -- --restore
```

---

## Ce que fait ce script en 1 seconde

Ce script élimine la surcharge visuelle et les processus d'arrière-plan non essentiels de votre macOS, offrant des économies réelles d'énergie GPU/CPU (particulièrement perceptibles sur les puces Apple Silicon M1/M2/M3) :

**🔍 Mode Turbo Spotlight**
Arrête l'indexation lourde des documents, photos et emails. Rend Spotlight ultra léger en ne recherchant que les Applications.

**⚡ Interface Zéro Délai**
Désactive complètement les animations de fenêtre, les effets de mouvement, la transparence, et fait que le Dock et le Centre de notification répondent instantanément.

**🎨 Optimisation du Rendu GPU**
Supprime les effets visuels lourds comme le flou de fenêtre, le défilement fluide et le rebond élastique pour alléger la charge de WindowServer.

**📡 Mode Arrière-plan Silencieux**
Désactive l'analyse Bluetooth/Radio en arrière-plan pour Handoff et AirDrop qui consomment silencieusement du CPU.

**🗑️ Ramasse-miettes de Cache**
Nettoie les fichiers de cache utilisateur obsolètes et accumulés sans perturber les fichiers utilisés activement par le système.

---

## Utilisation

```bash
source tune_mac.sh
tune_mac            # appliquer
tune_mac restore    # rétablir les valeurs par défaut de macOS
```

Journal complet : `~/Library/Logs/tune_mac_*.log`