# dotfiles

## usage

Clone in home dir.
```bash
$ cd;git clone git@github.com:inosy22/dotfiles.git
```

This scripts create symbolic link to home dir from dotfiles.
This command run `rm -i ~/${target_files} before to create symbolic link.
```bash
$ bash ~/dotfiles/link.sh;source ~/.bash_profile
```

If you want to create by compulsion, you should use -f option.
This command run `rm -f ~/${target_file}` before to create symbolic link.
```bash
$ bash ~/dotfiles/link.sh -f;source ~/.bash_profile
```

## add files
If you want to add dotfiles, you should add file to files dir.
link.sh is automatically pick up file in files dir.
```bash
# create new file
$ vim ~/dotfiles/files/${target_file}

# run script
$ sh ~/dotfiles/link.sh -f
```
