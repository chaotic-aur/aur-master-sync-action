#!/usr/bin/env sh
set -eu

/setup-ssh.sh

_PKGBASE="$(sed -nE '/pkgbase/s/pkgbase = (.+)$/\1/p' .SRCINFO)"

export GIT_SSH_COMMAND='ssh -v -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no'
git remote add aur "ssh://aur@aur.archlinux.org/${_PKGBASE}.git"
git push aur master
