# dotfiles

This repository contains my configuration files in the [`config`](https://github.com/evokateur/dotfiles/tree/config) branch.

To deploy configuration to a new machine:

```shell
git clone git@github.com:evokateur/dotfiles.git
cd dotfiles
./bootstrap.sh
```

Running `bootstrap.sh`

1. Clones the `config` branch as a bare repository into `~/.dotfiles`

2. Backs up any pre-existing files that would be overwritten to `~/.dotfiles-backup`

3. Checks out the files from the `config` branch into `~/.`

4. Configures the `~/.dotfiles` repo to ignore untracked files
