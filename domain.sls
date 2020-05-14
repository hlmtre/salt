/etc/nsswitch.conf:
  file.managed:
    - name: /etc/nsswitch.conf
    - source: salt://managed_files/nsswitch.conf
  require:
    - pkg: sssd

/etc/ssh_config:
  file.managed:
    - name: /etc/ssh/ssh_config
    - source: salt://managed_files/ssh_config
  require:
    - pkg: sssd

/etc/sssd/sssd.conf:
  file.managed:
    - name: /etc/sssd/sssd.conf
    - source: salt://managed_files/sssd.conf
    - template: jinja
    - context:
      fqdn: {{ grains['fqdn'] }}
  require:
    - pkg: sssd
    - pkg: sssd-tools

# create home directories for users when they first log in
/etc/pam.d/common-session:
  file.append:
    - text:
      - 'session required        pam_mkhomedir.so skel=/etc/skel/ umask=0022'
  require:
    - pkg: samba-common
    - pkg: krb5-user

# restart security services daemon now that AD auth is configured
restart_sssd:
  cmd.run:
    - name: systemctl restart sssd
