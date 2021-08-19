scr=$0:A

# Stop sudo from timing out
sudo -v
sleep 5

while true; do
    sudo -v
    sleep 60
done &

# Install xcode command line tools
chomp() {
  printf "%s" "${1/"$'\n'"/}"
}

touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress

softwareupdate -l

  clt_label_command="/usr/sbin/softwareupdate -l |
                      grep -B 1 -E 'Command Line Tools' |
                      awk -F'*' '/^ *\\*/ {print \$2}' |
                      sed -e 's/^ *Label: //' -e 's/^ *//' |
                      sort -V |
                      tail -n1"
  clt_label="$(chomp "$(/bin/bash -c "$clt_label_command")")"
  echo $clt_label


  if [[ -n "$clt_label" ]]; then
    echo "Installing $clt_label"
    softwareupdate -i $clt_label
    #execute_sudo "/bin/rm" "-f" "$clt_placeholder"
    #execute_sudo "/usr/bin/xcode-select" "--switch" "/Library/Developer/CommandLineTools"
  fi


rm /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress



yes '' | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

mkdir -p ~/source/ansible/
cd ~/source/ansible

#git clone https://github.com/foldedwave/mac-dev-playbook.git
#cd mac-dev-playbook

#python3 -m venv ~/source/ansible/mac-dev-playbook/venv
#source venv/bin/activate

#python3 -m pip install --upgrade pip
#python3 -m pip install -r requirements.txt


# BREW
brew update
brew upgrade

brew tap mongodb/brew

if [[ "$(uname -m)" == "x86_64" ]]; then
  brew install miniconda
else
  brew install miniforge
fi

brew install \
  mariadb \
  mongodb-community \
  mas

brew install --cask \
  rider \
  visual-studio-code \
  julia \
  docker

# CLEANUP
rm $scr
