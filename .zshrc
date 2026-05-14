export PATH="$HOME/Documents/.brew/bin:$HOME/Documents/.brew/sbin:$PATH"
deltarune_random() {
  local total_lines=$(wc -l < ~/Desktop/temp.txt 2>/dev/null || return)
  [[ $total_lines -lt 3 ]] && return
  local start_line=$((RANDOM % ($total_lines - 5)))
  local end_line=$((start_line + 5))
  sed -n "$(printf '%d,%dp\n' $start_line $end_line)" ~/Desktop/temp.txt | while IFS= read -r line; do
    echo "$line"
    echo ""
  done
}
deltarune_random | cowsay | lolcat
read
clear
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

unalias run-help 2>/dev/null
autoload run-help
setopt INTERACTIVE_COMMENTS 
export MANPAGER='nvim +Man!'
export HELPDIR="/usr/share/zsh/5.9/help"
export HOMEBREW_NO_ENV_HINTS=1
alias rm='echo "DELETE BLOCKED"' # I KNOW I KNOW. i just can't stop myself from compulsively deleting everything (i may or may not have OCD) so uh yeah
alias rmdir='echo "DELETE BLOCKED"'
alias shred='echo "DELETE BLOCKED"'
alias tetris=yetris
alias snake=nsnake
alias pacman=myman
alias vi=nvim
alias vim=nvim
alias ez='nvim ~/.zshrc'
alias sz='source ~/.zshrc'
alias octave='DYLD_LIBRARY_PATH="/Users/student/Documents/.brew/Cellar/gcc/15.2.0_1/lib/gcc/current" octave --gui'
alias code="open -a \"Visual Studio Code\" \."
alias ls=eza
alias cat=bat
alias top=htop
alias find=fd
alias grep=rg
alias clean=wipeclean
alias ..="cd .."
alias nosleep="sudo pmset -a disablesleep 1"
alias yessleep="sudo pmset -a disablesleep 0"
alias ":q!"=exit
ungate() {
        sudo codesign --force --deep --sign - "$1" && sudo xattr -cr "$1"
}
hgp() {
        history "$1" | grep -i "$2"
}
bgp() {
        brew list | grep -i "$1"
}
lgp() {
        ls -a | grep -i "$1"
}
cgp() {
        whence -wm '*' | sed 's/:[^:]*$//' | grep -i "$1"
}

export PATH="$HOME/.pyenv/shims:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.texlive/2025/bin/universal-darwin:$PATH"
export PATH="$HOME/Applications/alda:$PATH"
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"
export JAVA_HOME="/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home"
export PATH="/Users/student/.local/bin:$PATH"
export PATH="/Users/student/aseprite/build/bin/Aseprite.app/Contents/MacOS:$PATH"
eval $(thefuck --alias)
eval "$(zoxide init zsh)"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/student/Applications/conda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/student/Applications/conda/etc/profile.d/conda.sh" ]; then
        . "/Users/student/Applications/conda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/student/Applications/conda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
export MAMBA_EXE='/Users/student/Applications/conda/bin/mamba';
export MAMBA_ROOT_PREFIX='/Users/student/Applications/conda';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
source /Users/student/Documents/.brew/share/powerlevel10k/powerlevel10k.zsh-theme

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
source $HOME/zsh-autoswitch-virtualenv-master/autoswitch_virtualenv.plugin.zsh

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000000
export SAVEHIST=1000000000
setopt EXTENDED_HISTORY
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# Source - https://superuser.com/q/1517138
# Posted by Amir Shabani, modified by community. See post 'Timeline' for change history
# Retrieved 2026-04-02, License - CC BY-SA 4.0


[ -f "/Users/student/.ghcup/env" ] && . "/Users/student/.ghcup/env" # ghcup-env
