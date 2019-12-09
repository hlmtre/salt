/etc/nsswitch.conf:
  file.managed:
    - name: /etc/nsswitch.conf
    - source: salt://managed_files/nsswitch.conf
  require:
    - pkg: sssd

# create home directories for users when they first log in
/etc/pam.d/common-session:
  file.prepend:
    - text:
      - 'session required        pam_mkhomedir.so skel=/etc/skel/ umask=0022'
  require:
    - pkg: samba-common
    - pkg: krb5-user

# restart security services daemon now that AD auth is configured
restart_sssd:
  cmd.run:
    - name: systemctl restart sssd
