eval "$(starship init zsh)"

eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_DEFAULT_OPTS="
--preview '
if [ -d {} ]; then
  eza -la --tree --level=2 {};
else
  bat --style=numbers --color=always {};
fi'
--preview-window=right:60%
"

export FZF_CTRL_R_OPTS='--no-preview'

source $HOME/.config/antigen.zsh 

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

alias python=python3
alias py=python3
alias make_stress_test="bash ~/code/cp-utils/stress-testing/make_stress_test.sh"
alias venv="source venv/bin/activate"

TERM=xterm-256color

export EDITOR=nvim
export VISUAL=nvim

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
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

antigen apply

# #
# # Use powerline
# #
# USE_POWERLINE="true"
# # Has weird character width
# # Example:
# #    is not a diamond
# HAS_WIDECHARS="false"
# # Source manjaro-zsh-configuration
# if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
#   source /usr/share/zsh/manjaro-zsh-config
# fi
# # Use manjaro zsh prompt
# if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
#   source /usr/share/zsh/manjaro-zsh-prompt
# fi
