# dotfiles

I've been a zsh user for many users (most of them with Prezto) and decided to update
my approach.  The main goal is to stay on the path of least resistance, using modules
and plugins I either understand entirely, or that are actively maintained.

Clone the repo to '~/.dotfiles' using this command:
`git clone https://github.com/jeffcox/dotfiles.git "${ZDOTDIR:-$HOME}/.dotfiles"`

Then run the bootsrap shell script; 
`zsh .dotfiles/install.zsh`

or invoke the ansible playbook directly:
`ansible-playbook .dotfiles/install.yml`

Some exceptions to this that I find useful enough to be exempt:
 * srg/F: There's some crazy awk in here that works, I don't care how anymore.
