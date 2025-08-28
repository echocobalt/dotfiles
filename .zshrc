# ▒███████▒  ██████  ██░ ██ ▓█████  ██▓     ██▓    
# ▒ ▒ ▒ ▄▀░▒██    ▒ ▓██░ ██▒▓█   ▀ ▓██▒    ▓██▒    
# ░ ▒ ▄▀▒░ ░ ▓██▄   ▒██▀▀██░▒███   ▒██░    ▒██░    
#   ▄▀▒   ░  ▒   ██▒░▓█ ░██ ▒▓█  ▄ ▒██░    ▒██░    
# ▒███████▒▒██████▒▒░▓█▒░██▓░▒████▒░██████▒░██████▒
# ░▒▒ ▓░▒░▒▒ ▒▓▒ ▒ ░ ▒ ░░▒░▒░░ ▒░ ░░ ▒░▓  ░░ ▒░▓  ░
# ░░▒ ▒ ░ ▒░ ░▒  ░ ░ ▒ ░▒░ ░ ░ ░  ░░ ░ ▒  ░░ ░ ▒  ░
# ░ ░ ░ ░ ░░  ░  ░   ░  ░░ ░   ░     ░ ░     ░ ░   
#  ▒█████    █████▒  ░▄▄▄█████▓ ██░ ██ ▓█████░     
# ▒██▒  ██▒▓██   ▒    ▓  ██▒ ▓▒▓██░ ██▒▓█   ▀      
# ▒██░  ██▒▒████ ░    ▒ ▓██░ ▒░▒██▀▀██░▒███        
# ▒██   ██░░▓█▒  ░    ░ ▓██▓ ░ ░▓█ ░██ ▒▓█  ▄      
# ░ ████▓▒░░▒█░         ▒██▒ ░ ░▓█▒░██▓░▒████▒     
# ░ ▒░▒░▒░  ▒ ░         ▒ ░░    ▒ ░░▒░▒░░ ▒░ ░     
#   ░ ▒ ▒░  ░             ░     ▒ ░▒░ ░ ░ ░  ░     
# ░ ░ ░ ▒   ░ ░         ░       ░  ░░ ░   ░        
# ▓█████▄ ▓█████ ▄▄▄    ░ ▓█████▄  ░                
# ▒██▀ ██▌▓█   ▀▒████▄    ▒██▀ ██▌                
# ░██   █▌▒███  ▒██  ▀█▄  ░██   █▌                 
# ░▓█▄   ▌▒▓█  ▄░██▄▄▄▄██ ░▓█▄   ▌                 
# ░▒████▓ ░▒████▒▓█   ▓██▒░▒████▓                  
#  ▒▒▓  ▒ ░░ ▒░ ░▒▒   ▓▒█░ ▒▒▓  ▒                  
#  ░ ▒  ▒  ░ ░  ░ ▒   ▒▒ ░ ░ ▒  ▒                  
#  ░ ░  ░    ░    ░   ▒  ░ ░ ░  ░                  
#    ░       ░  ░     ░   ░  ░                     
# ░                       ░

# <b>OH YES... THAT IS BLOOD</b>

# === LOAD zshrc NOT bashrc ===
[[ -f /etc/zshrc ]] && source /etc/zshrc

# === BREW SOME COFFEE... I MEAN LOAD HOME/LINUXBREW ===
if [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# === .python ===
export PYTHONDONTWRITEBYTECODE=1 # don't save __pycache__ it looks ugly... 
alias py="python3"
alias pip="python3 -m pip"  # safer than plain pip3

# === PROMPT.config ===
setopt PROMPT_SUBST
autoload -Uz colors && colors
PROMPT='%F{cyan}%~%f%F{green}$ %f'

# === BETTER cd (zoxide) ===
eval "$(zoxide init zsh)"
alias cd="z"

# === UTILITY BELT ===
alias bay='yt-dlp -f "bv*+ba/b" --sub-lang "en" --write-subs \
  --embed-subs --embed-metadata --embed-thumbnail \
  -o "%(title)s.%(ext)s" --quiet --progress'
alias movies="py ~/docs/grace/whichMovie/src/main.py"
alias stardew="cd ~/games/Stardew\ Valley && ./start.sh"
alias update="sudo pacman -Syu"
alias sql="mysql -u root -p"
alias open="xdg-open"
alias gary="chmod +x"
alias backup="py ~/docs/grace/justInCase/src/main.py"
alias alfred="nvim ~/.zshrc && source ~/.zshrc"
alias spot="cd && ./.spotify.sh"
alias grace="cd ~/docs/grace/ && nvim ."
alias ls="eza --icons=always"

# === YAZI... THE CLI FILE EXPLORER ===
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}

# === HIStory SETUP (TAKE THAT MJ!!!) ===
HISTFILE=$HOME/.zsh_history
SAVEHIST=5000
HISTSIZE=5000
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# === NOW COMES THE KEYBINDINGS ===
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# === AUTOCORRECT... TYPOS ===
setopt correct

alias l=ls
alias ll="ls -l"
alias la="ls -a"
alias sl=ls
alias cd..="cd .."
alias gti=git
# alias note="I'll add more later..." 

# === GIT SHORTHANDS ===
alias gs="git status"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit -m"
alias gpo="git push -u origin main"
alias gcl="git clone"

# === AUTO-SUGGESTIONS ===
if [[ -r ~/.local/share/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source ~/.local/share/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'  # dim grey suggestion
fi

# === SYNTAX HIGHLIGHTING ===
if [[ -r ~/.local/share/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source ~/.local/share/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# === GOODBYE YELLOW BRICK ROAD ===
