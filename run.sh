xcode-select --install

mkdir -p ~/source/ansible/
cd ~/source/ansible

git clone https://github.com/foldedwave/mac-dev-playbook.git

python3 -m venv ~/source/ansible/mac-dev-playbook/venv
source venv/bin/activate

python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt
