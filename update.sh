autoload colors; colors

echo $fg[green]Running Update Script$reset_color

originalCRC=$(crc32 ./update.sh)
git pull
newCRC=$(crc32 ./update.sh)

if [[ $newCRC != $originalCRC ]]; then
  echo $fg[green]Update script updated, restarting$reset_color
  . ./update.sh
  return
fi

softwareupdate -ia

. ./brew.sh
. ./mas.sh
