# Upstream

| | |
| --- | --- |
| Project | Google CTF (official archive of challenges) |
| Repository | https://github.com/google/google-ctf |
| Challenge | `2023/quals/pwn-storygen` (Google CTF 2023) |
| Version | master (the archive has no releases) |
| Commit | 4a8f8d7808254d40f226ac2ab4604601e0e57d57 |
| Licence | Apache-2.0 |

| Here | google-ctf path |
| --- | --- |
| `build/challenge/app/` | [`2023/quals/pwn-storygen`](https://github.com/google/google-ctf/tree/4a8f8d7808254d40f226ac2ab4604601e0e57d57/2023/quals/pwn-storygen) |

The vendored folder is that commit's challenge folder, unchanged, without its Git history. The flag
is upstream's own (the `flag` file, read by the `get_flag` binary built from `get_flag.c`).

The archive does not commit the compiled binary (kCTF builds it with `make -C challenge` before `docker build`), so `build/challenge/Dockerfile` is upstream's Dockerfile plus a first stage that runs the challenge's own Makefile on the chroot's base image; its header lists every difference.

To update, replace the vendored folder with a newer google-ctf commit, then change this file.
