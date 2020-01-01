ssh:
  service.running:
    - name: ssh
    - enable: True

rsyslog:
  service.running:
    - name: rsyslog
    - enable: True

sssd:
  service.running:
    - name: sssd
    - enable: True

systemd-logind:
  service.running:
    - name: systemd-logind
    - enable: True

chrony:
  service.running:
    - name: chrony
    - enable: True
