# install a basic set of packages for general sysadmin work
install_basics:
  # ensure package database is up to date before installing (reduces number of 404s on apt servers)
  cmd.run:
    - name: apt update
    - name: apt -y autoremove

  pkg.installed:
    - pkgs: 
      - vim
      - git
      - sudo
      - build-essential
      - libncurses5-dev 
      - libncursesw5-dev 
      - autoconf
      - open-vm-tools
      - openssh-server
      - tmux
      - fail2ban
