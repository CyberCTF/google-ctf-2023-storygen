#!/bin/sh
# Upstream compiles the flag into /chroot/get_flag. This replaces it at every start with a script that
# prints the player's flag (CTF_FLAG_MAIN, given by the launcher) the same way; without one
# (CI, a run by hand) the development flag. A script must be readable to run, so it is mode 555.
dev='CTF{dev-google-ctf-2023-storygen}'
v="${CTF_FLAG_MAIN:-$dev}"
f=/chroot/get_flag
rm -f "$f"
cat > "$f" <<EOF
#!/bin/sh
if [ \$# -ne 3 ]; then echo "Usage: \$0 Give flag please"; exit 1; fi
if [ "\$1" = Give ] && [ "\$2" = flag ] && [ "\$3" = please ]; then echo '$v'; fi
EOF
chmod 555 "$f"
