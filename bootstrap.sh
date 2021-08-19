scr=$0:A

autoload colors; colors

# Stop sudo from timing out
sudo -v
sleep 5

while true; do
    sudo -v
    sleep 60
done &


# Install Command Line Tools if needed
chomp() {
  printf "%s" "${1/"$'\n'"/}"
}

xcode-select -p 1>/dev/null

if [[ '0' == $? ]]; then
  echo $fg[green]Command Line Tools already installed$reset_color
else
  echo $fg[green]Installing Command Line Tools$reset_color

  touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress

  clt_label_command="/usr/sbin/softwareupdate -l |
                     grep -B 1 -E 'Command Line Tools' |
                     awk -F'*' '/^ *\\*/ {print \$2}' |
                     sed -e 's/^ *Label: //' -e 's/^ *//' |
                     sort -V |
                     tail -n1"
  clt_label="$(chomp "$(/bin/bash -c "$clt_label_command")")"

  if [[ -n "$clt_label" ]]; then
    softwareupdate -i $clt_label
    #execute_sudo "/bin/rm" "-f" "$clt_placeholder"
    #execute_sudo "/usr/bin/xcode-select" "--switch" "/Library/Developer/CommandLineTools"
  fi

  rm /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
fi


# Clone this repo or update
mkdir -p ~/source/provisioning/
cd ~/source/provisioning

if [ ! -d "./mac-dev-playbook" ]; then
  echo $fg[green]Cloning Repo$reset_color
  git clone https://github.com/foldedwave/mac-dev-playbook.git
  cd mac-dev-playbook
else
  echo $fg[green]Updating Repo$reset_color
  cd mac-dev-playbook
  git pull
fi


#python3 -m venv ~/source/ansible/mac-dev-playbook/venv
#source venv/bin/activate

#python3 -m pip install --upgrade pip
#python3 -m pip install -r requirements.txt



# Run the update scripts
. ./update.sh



# CLEANUP
rm $scr
