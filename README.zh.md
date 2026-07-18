# tune_mac — 让你的 Mac 超快 ⚡

[English](./README.md) | [Bahasa Indonesia](./README.id.md) | [Español](./README.es.md) | [Français](./README.fr.md) | [Deutsch](./README.de.md) | [日本語](./README.ja.md) | [中文](./README.zh.md)

一行命令。无需安装。随时可恢复。

### 应用（加速）
```bash
curl -fsSL https://raw.githubusercontent.com/febritecno/tune_mac/main/tune_mac.sh | bash
```

### 恢复（回到 macOS 默认值）
```bash
curl -fsSL https://raw.githubusercontent.com/febritecno/tune_mac/main/tune_mac.sh | bash -s -- --restore
```

---

## 这个脚本在 1 秒内做的事

这个脚本消除你 macOS 上的视觉开销和不必要的后台进程，带来真实的 GPU/CPU 省电效果（在 Apple Silicon M1/M2/M3 芯片上尤其明显）：

**🔍 Spotlight 涡轮模式**
停止文档、照片和邮件的繁重索引。让 Spotlight 只搜索应用程序，变得超轻量。

**⚡ 零延迟界面**
完全禁用窗口动画、动态效果、透明度，让 Dock 和通知中心即时响应。

**🎨 GPU 渲染优化**
移除窗口模糊、平滑滚动、橡皮筋回弹等重度视觉效果，减轻 WindowServer 负担。

**📡 后台静默模式**
禁用 Handoff 和 AirDrop 的后台蓝牙/无线扫描，这些悄悄消耗 CPU。

**🗑️ 缓存垃圾回收器**
清理陈旧、堆积的用户缓存文件，不干扰系统正在使用的文件。

---

## 使用方法

```bash
source tune_mac.sh
tune_mac            # 应用
tune_mac restore    # 恢复到 macOS 默认值
```

完整日志：`~/Library/Logs/tune_mac_*.log`