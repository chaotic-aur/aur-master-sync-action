#!/usr/bin/env sh
set -eu

/setup-ssh.sh

export GIT_SSH_COMMAND='ssh -v -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no'
git remote add aur "ssh://aur@aur.archlinux.org/$(sed -nE '/pkgbase/s/pkgbase = (.+)$/\1/p' .SRCINFO).git"
git push aur master
