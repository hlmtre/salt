/etc/tmux.conf:
  file.managed:
    - name: /etc/tmux.conf
    - source: salt://managed_files/tmux.conf
  require:
    - pkg: tmux

/etc/profile:
  file.append:
    - text: 
      - "# make dig do lookups adding the search domain"
      - alias dig="dig +search"
  require:
    - pkg: dig
