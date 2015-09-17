External VIP mapibeta.flipkart.com configuration setup:
--------------------------------------------------------

Copy these files to /etc/haproxy/ directory. Change parameters in backend.cfg,
frontend.cfg and global.cfg. Then run ./run.sh <n>, which creates haproxy.cfg.
It makes 'n' copies of the configuration file, and modifies each to change the
haproxy socket name and stats socket port#. Further it creates the directory
for haproxy socket, and reloads haproxy.

A sample haproxy.cfg is also present to show what the current version from
external (mapibeta.flipkart.com) looks like.

