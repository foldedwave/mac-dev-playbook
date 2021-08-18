# Install brew now - we will use it anyway but this handily installs mac command line tools too
sudo whoami
yes '' | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

mkdir -p ~/source/ansible/
cd ~/source/ansible

git clone https://github.com/foldedwave/mac-dev-playbook.git

# Do all python related commands inside a venv
python3 -m venv ~/source/ansible/mac-dev-playbook/venv
source venv/bin/activate

python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt
