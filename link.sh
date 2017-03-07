#! /bin/bash
FILES_DIR='files'

# files
if [ ! -d files ]; then
  echo '[EROR] files directory is missing.'
  exit 1
fi
FILS=$(ls files)

for FILE in $FILES; do
  ln -s ~/dotfiles/${FILE} ~/${FILE}
done
source ~/.bash_profile
