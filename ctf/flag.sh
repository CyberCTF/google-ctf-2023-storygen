#!/bin/sh
# >>> isoloom-1.0 secret-from-file shim (auto-added by convert-lab.py) >>>
# Inputs now arrive as files (isoloom.yml `files:`), not environment variables.
# Read each into its old variable when unset, keeping the dev/CI fallback working.
for __p in CTF_FLAG_MAIN:/run/lab/ctf_flag_main; do
  __n=${__p%%:*}; __f=${__p#*:}
  eval "__v=\${$__n:-}"
  if [ -z "$__v" ] && [ -s "$__f" ]; then
    __v=$(tr -d '\r\n' < "$__f"); eval "export $__n=\"\$__v\""
  fi
done
unset __p __n __f __v 2>/dev/null || true
# <<< isoloom-1.0 secret-from-file shim <<<
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
