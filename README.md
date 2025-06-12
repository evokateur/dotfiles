# dotfiles

This repository contains configuration files in the [`config`](https://github.com/evokateur/dotfiles/tree/config) branch.

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

The `.zshrc` in the config branch contains a `dotfiles` function for working with the `~/.dotfiles` repo

```shell
dotfiles() {
    if [[ "$1" == "add" && "$2" == "." ]]; then
        echo "❌ Refusing to run 'dotfiles add .' — be specific!"
        return 1
    fi
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME "$@"
}
```

as well as a corresponding alias.

```shell
alias dot='dotfiles'
```

Some example usage below

```shell
√ ~ $ dot status
On branch config
nothing to commit (use -u to show untracked files)
√ ~ $ dot add .
❌ Refusing to run 'dotfiles add .' — be specific!
?1 ~ $ dot add .zprofile
√ ~ $ dot status
On branch config
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	new file:   .zprofile

Untracked files not listed (use -u option to show untracked files)
```

