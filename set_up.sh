#!/bin/bash
sudo sed -i 's|http://tw.archive.ubuntu.com/ubuntu/|http://free.nchc.org.tw/ubuntu/|g' /etc/apt/sources.list
sudo apt update
sudo apt install -y vim tmux htop curl wget git putty ssh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cat << EOF >> ~/.bashrc
export VISUAL=vim
export EDITOR="$VISUAL"
EOF

cat << EOF >> ~/.bash_profile
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
EOF

cat << EOF >> ~/.vimrc
set ai
set bg=dark
set nu
set expandtab
set tabstop=4
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>
EOF

cat << EOF >> ~/.tmux.conf
set -g default-terminal "screen-256color"
set -g mouse on

# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'git@github.com/user/plugin'
# set -g @plugin 'git@bitbucket.com/user/plugin'

#tmux-resurrect
set -g @plugin 'tmux-plugins/tmux-resurrect'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run -b '~/.tmux/plugins/tpm/tpm'
EOF

git config --global user.name "Bright"
git config --global user.email dglpw7546@gmail.com
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=10800'

