P=$(dirname -- "$( readlink -f -- "$0"; )");

git -C $P add .
git -C $P commit -m "Update"
git -C $P push
