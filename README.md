# dotfiles

This repository contains configuration files in the [`config`](https://github.com/evokateur/dotfiles/tree/config) branch

To deploy configuration to a new machine:

```shell
git clone git@github.com:evokateur/dotfiles.git
cd dotfiles
./bootstrap.sh
```

Running `bootstrap.sh`

1. Clones the `config` branch as a bare repository into `~/.dotfiles`

2. Moves pre-existing files that would be overwritten to `~/.dotfiles-backup`

3. Checks out the files from the `config` branch into `~/.`

4. Configures the `~/.dotfiles` repo to ignore untracked files

Both `.zshrc` and `.bashrc` in the `config` branch source `~/.config/shell/includes/dotfiles.sh`,
which contains a function for working with the `~/.dotfiles` repo:

```shell
dotfiles() {
    if [[ "$1" == "add" && "$2" == "." ]]; then
        echo "❌ Refusing to run 'dotfiles add .' — be specific!"
        return 1
    fi
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME "$@"
}
```

Some example usage below

```sh
√ ~ $ dotfiles status
On branch config
nothing to commit (use -u to show untracked files)
√ ~ $ dotfiles add .
That would add everything in your home directory! D:
You probably mean: 'dotfiles add -u'..
?1 ~ $ dotfiles add .zprofile
√ ~ $ dotfiles status
On branch config
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
 new file:   .zprofile

Untracked files not listed (use -u option to show untracked files)
```
