eval "$(starship init zsh)"

source $HOME/.config/antigen.zsh 

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

alias python=python3
alias py=python3
alias cf="~/other/cf_v1.0.5_linux_64/cf"
alias make_stress_test="bash ~/code/cp-utils/stress-testing/make_stress_test.sh"
alias venv="source venv/bin/activate"
alias alacfg="vim '/mnt/c/users/madzi/scoop/persist/alacritty/alacritty.yml'"
alias cdc="cd '/mnt/c'"
alias cdd="cd '/mnt/d'"
alias tmux='tmux -2'

TERM=xterm-256color

# vi mode
bindkey -v
# Remove delay when entering normal mode (vi)
KEYTIMEOUT=5
# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]] || [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ $KEYMAP == main ]] || [[ $KEYMAP == viins ]] || [[ $KEYMAP = '' ]] || [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
# Start with beam shape cursor on zsh startup and after every command.
zle-line-init() { zle-keymap-select 'beam'}

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt appendhistory

antigen apply

