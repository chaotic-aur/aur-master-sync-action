# README

A GitHub Action for mirroring a repository's master branch to [AUR](https://aur.archlinux.org).

This will only push commits.

## Usage

On a branch which is not `master` (as AUR does not support subdirectories), add the following to `.github/workflows/mirroring.yml`:

```yaml
name: Mirroring

on:
  push:
    branches: [master]

jobs:
  to_aur:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
        with:
          ref: master
      - uses: chaotic-aur/aur-master-sync-action@v1
        with:
          ssh_private_key: ${{ secrets. AUR_SSH_KEY  }}
```

> ⚠️ It's recommended to force linear history in the master branch.

### AUR_SSH_KEY

To find out how to create and add the `AUR_SSH_KEY`, follow the steps below:

1. [How to generate an SSH key pair](https://docs.gitlab.com/ee/ssh/#generate-an-ssh-key-pair). Recommended encryption would be _at least_ `2048-bit RSA`.
2. Add the _public_ key to your AUR account.
3. Add the _private_ key as a secret to your workflow. More information on [creating and using secrets](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/creating-and-using-encrypted-secrets).
