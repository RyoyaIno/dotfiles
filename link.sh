#!/bin/bash
IS_FORCE=false

# check option arguments
while getopts f OPT; do
  case $OPT in
    "f" )
      IS_FORCE=true
      ;;
  esac
done

# prepare
dir=$(cd $(dirname $0); pwd)/files
files=$(ls -A $dir)

# create link
for file in $files; do
  # remove exists file
  if test -e ~/$file || test -h ~/$file; then
    if $IS_FORCE; then
      rm -f ~/$file
    else
      rm -i ~/$file
    fi
  fi
  # create symlink
  if test -e $dir/$file && test ! -e ~/$file && test ! -h ~/$file; then
    ln -s $dir/$file ~/$file && echo "Created link ${file}"
  else
    echo "Skip ${file}"
  fi
done

