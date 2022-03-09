autoload colors; colors

echo $fg[green]Running Update Script$reset_color

originalCRC=$(crc32 ./update.sh)
git pull --ff-only 1>/dev/null
newCRC=$(crc32 ./update.sh)

if [[ $newCRC != $originalCRC ]]; then
  echo $fg[green]Update script updated, restarting$reset_color
  . ./update.sh
  return
fi

softwareupdate -ia 1>/dev/null

#defaults read > /tmp/before

. ./brew.sh
. ./mas.sh
. ./osx.sh
. ./shell.sh
. ./rust.sh

#defaults read > /tmp/after

if [[ "$(diff /tmp/before /tmp/after)" != "" ]]; then
  sudo shutdown -r now
fi


# Restart affected applications if `--no-restart` flag is not present.
#if [[ ! ($* == *--no-restart*) ]]; then
#  for app in "cfprefsd" "Dock" "Finder" "Mail" "SystemUIServer"; do
#    killall "${app}" > /dev/null 2>&1
#  done
#fi
