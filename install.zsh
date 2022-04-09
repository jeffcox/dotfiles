#! /usr/bin/env zsh
setopt EXTENDED_GLOB

# Currently designed for a fresh device, this zsh script gets us into ansible,
# where the real work can be done.

# Check if we have ansible in our $PATH


# Ansible for mac
function mac-install {
	if [[ -x /opt/local/bin/port ]]; then
		echo "macports detected"
		_pkg_manager='port'
		sudo /opt/local/bin/port install ansible
	elif [[ -x /opt/homebrew/bin/brew ]]; then
		echo "modern homebrew detected"
		_pkg_manager='brew'
		/opt/homebrew/bin/brew install ansible
	elif [[ -x /usr/local/bin/brew ]]; then
		echo "legacy homebrew detected"
		_pkg_manager='brew'
		sudo /usr/local/bin/brew install ansible
	else;
		echo "No package manager found, installing homebrew"
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		_pkg_manager='brew'
		/opt/homebrew/bin/brew install ansible
	fi
	if [[  -f $HOME/.zshrc ]]; then
		echo "found an existing zshrc, moving it"
		mv $HOME/.zshrc $HOME/.zshrc.orig
	fi
}

# Ansible for bsd
function bsd-install {
	echo "bsd is not yet implemented"
}

# Ansible for linux
function linux-install {
	echo "linux is not yet implemented"
}

# Use the install function for the detected OS
if [[ "$OSTYPE" == darwin* ]]; then
	mac-install
elif [[ "$OSTYPE" == freebsd* ]]; then
	bsd-install
elif [[ "$OSTYPE" == linux* ]]; then
	linux-install
fi

# Call the playbook
ansible-playbook install.yml

