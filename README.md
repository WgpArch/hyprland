<div align="center">

  <img src="https://img.shields.io/badge/Arch_Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white" alt="Arch Linux">
  <img src="https://img.shields.io/badge/Wayland-00B4F0?style=for-the-badge&logo=wayland&logoColor=white" alt="Wayland">
  <img src="https://img.shields.io/badge/Hyprland-58E1FF?style=for-the-badge&logo=hyprland&logoColor=white" alt="Hyprland">
  <img src="https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge" alt="License">

  <br><br>

  Tiling Wayland Compositor with Eye-Candy on Arch Linux.

</div>

---


# Hyprland Config for Arch Linux

Personal Hyprland WM configuration with Waybar (top bar) and system scripts.

## 📁 Structure
~/.dotfiles/hyprland/
├── configs/
│   ├── hypr/
│   │   └── hyprland.conf      # Main Hyprland config
│   ── waybar/
│       ├── config.jsonc       # Waybar layout & modules
│       ├── style1.css         # Waybar theme
│       └── scripts/
│           ├── player.sh      # MPRIS player widget
│           ── weather.py     # OpenWeatherMap widget
├── .gitignore                 # Excludes wallpapers & API keys
└── README.md
