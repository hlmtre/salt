# install a basic set of packages for general sysadmin work
install_basics:
  # ensure package database is up to date before installing (reduces number of 404s on apt servers)
  cmd.run:
    - name: apt update
    - name: apt -y autoremove

  pkg.installed:
    - pkgs:
      - vim # general system
      - git
      - sudo
      - qemu-guest-agent
      - openssh-server
      - tmux
      - fail2ban
      - htop
      - haveged
      - sssd-tools
      - build-essential # general dev
      - cmake
      - libncurses5-dev
      - libncursesw5-dev
      - libgif-dev # emacs build
      - libjpeg-dev
      - libpng-dev
      - libtiff-dev
      - texinfo
      - libgnutls28-dev
      - autoconf
      - bison # rofi build
      - flex
      - meson
      - libpango1.0-dev
      - libcairo2-dev
      - libxkbcommon-dev
      - libxkbcommon-x11-dev
      - libxcb-ewmh-dev
      - libxcb-icccm4-dev
      - libxcb-xinerama0-dev
      - libxcb-randr0-dev
      - libxcb-xrm-dev
      - libstartup-notification0-dev
      - librsvg2-dev
      - dh-autoreconf # i3-gaps
      - libxcb-keysyms1-dev
      - libxcb-util0-dev
      - xcb
      - libxcb1-dev
      - libyajl-dev
      - libev-dev
      - libxcb-xkb-dev
      - libxcb-cursor-dev
      - libxcb-shape0
      - libxcb-shape0-dev
      - libdbus-1-dev # i3status-rust
