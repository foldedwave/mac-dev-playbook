originalCRC = crc32 ./update.sh
git pull
newCRC = crc32 ./update.sh

if [[ $newCRC != originalCRC ]]; then
  . ./update.sh
  exit
fi

softwareupdate -ia

. ./brew.sh
. ./mas.sh
