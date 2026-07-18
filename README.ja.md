# tune_mac — Macを超高速化 ⚡

[English](./README.md) | [Bahasa Indonesia](./README.id.md) | [Español](./README.es.md) | [Français](./README.fr.md) | [Deutsch](./README.de.md) | [日本語](./README.ja.md) | [中文](./README.zh.md)

1行。インストール不要。いつでも元に戻せます。

### 適用（高速化）
```bash
curl -fsSL https://raw.githubusercontent.com/febritecno/tune_mac/main/tune_mac.sh | bash
```

### 復元（macOSのデフォルトに戻す）
```bash
curl -fsSL https://raw.githubusercontent.com/febritecno/tune_mac/main/tune_mac.sh | bash -s -- --restore
```

---

## このスクリプトが1秒で行うこと

このスクリプトはmacOS上の視覚的オーバーヘッドと不要なバックグラウンドプロセスを排除し、実際のGPU/CPU省電力効果をもたらします（Apple Silicon M1/M2/M3チップで特に顕著）：

**🔍 Spotlightターボモード**
書類、写真、メールの重いインデックス作成を停止。Spotlightはアプリのみを検索するようになり超軽量化されます。

**⚡ ゼロ遅延UI**
ウィンドウアニメーション、モーション効果、透明度を完全に無効化し、Dockと通知センターが瞬時に応答するようにします。

**🎨 GPUレンダリング最適化**
ウィンドウブラー、スムーズスクロール、ラバーバンドバウンスなどの重い視覚効果を削除し、WindowServerの負荷を軽減します。

**📡 バックグラウンドサイレントモード**
HandoffとAirDropのためのバックグラウンドBluetooth/無線スキャンを無効化し、ひそかにCPUを消費するのを防ぎます。

**🗑️ キャッシュガベージコレクタ**
システムが現在使用中のファイルを妨げずに、古く蓄積したユーザーキャッシュファイルをクリーンアップします。

---

## 使い方

```bash
source tune_mac.sh
tune_mac            # 適用
tune_mac restore    # macOSのデフォルトに戻す
```

完全なログ：`~/Library/Logs/tune_mac_*.log`