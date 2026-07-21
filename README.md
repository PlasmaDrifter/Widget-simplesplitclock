# Simple Split Clock Widget

[![KDE Plasma 6](https://img.shields.io/badge/KDE_Plasma-6.0+-3152A0?style=for-the-badge&logo=kde&logoColor=white)](https://kde.org/plasma-desktop/)
[![QML](https://img.shields.io/badge/UI-QML%2FQt6-41CD52?style=for-the-badge&logo=qt&logoColor=white)](https://doc.qt.io/qt-6/qtqml-index.html)
[![Category](https://img.shields.io/badge/Clock%20%26%20Time-34C759?style=for-the-badge&logo=clock&logoColor=white)](https://github.com/PlasmaDrifter)
[![License](https://img.shields.io/badge/License-GPLv2-blue.svg?style=for-the-badge)](LICENSE)

An elegant dual-toned split digital clock and date widget for KDE Plasma 6.

---

## Previews

![Simple Split Clock Widget Preview](simplesplitclock.png)

![Simple Split Clock Widget Preview](desktop-2.png)

---

## Features

- **Dual-toned**: split color typography for hours and minutes
- **Customizable**: date format and time zone display
- **Scalable**: vector typography
- **Transparent**: background

## Requirements

- **Environment**: KDE Plasma 6.0 or higher
- **Framework**: Qt6 QML / Plasma Applet API

## Installation

### Option 1: Git Clone (Recommended)
```bash
mkdir -p ~/.local/share/plasma/plasmoids/
git clone https://github.com/PlasmaDrifter/simplesplitclock.git ~/.local/share/plasma/plasmoids/local.widget.simplesplitclock
```

### Option 2: Plasma Package Installer
```bash
kpackagetool6 -i ~/.local/share/plasma/plasmoids/local.widget.simplesplitclock
```

Then right-click your desktop or panel $\rightarrow$ **Add Widgets...** and search for the widget name.

## Credits & License

- **Author / Maintainer**: PlasmaDrifter
- **License**: Licensed under the [GPLv2](LICENSE).
