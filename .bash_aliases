# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias gh='history | grep'
alias lg='lazygit'
alias hs='nix-shell -p haskell-language-server'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cg='cd `git rev-parse --show-toplevel`'
alias ec='emacsclient -c &'
alias es='/usr/bin/emacs --daemon &'

alias vim='hx'

# alias emacs="emacsclient -c -a 'emacs'"

# to build default.nix from a cabal-package
alias cabal2nix='nix-shell --packages cabal2nix --run "cabal2nix ." > default.nix && printf "let\n  pkgs = import <nixpkgs> { };\nin\n  pkgs.haskellPackages.callPackage ./default.nix { }" > release.nix'
alias build='nix-build release.nix'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
