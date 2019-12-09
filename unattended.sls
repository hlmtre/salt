install_requirements:
  pkg.installed:
    - pkgs:
      - apt-listchanges

/etc/apt/apt.conf.d/50unattended-upgrades:
  file.managed:
    - name: /etc/apt/apt.conf.d/50unattended-upgrades
    - source: salt://managed_files/50unattended-upgrades
  require:
    - pkg: unattended-upgrades
    - pkg: apt-listchanges

syslog:
  file.managed:
    - name: /etc/rsyslog.conf
    - source: salt://managed_files/rsyslog.conf
  require:
    - pkg: rsyslog
  cmd.run:
    - name: systemctl restart rsyslog
    - onchanges:
      - file: /etc/rsyslog.conf
