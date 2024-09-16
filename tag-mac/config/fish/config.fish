if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

# alias begin
alias ld='ls -d */'
alias c='clear'
alias e='exit'
alias pip='pip3'
alias proxy='export all_proxy=socks5://127.0.0.1:6153'
alias hp='export http_proxy=http://127.0.0.1:6152;export https_proxy=http://127.0.0.1:6152'
alias t='tldr'
alias mkidr='mkdir -p'

alias tnew='tmux new -s'
alias tkall='tmux kill-session -a'
alias ta='tmux attach-session'

alias ga='git status'
alias gc='git clone'
alias gm='git commit -a -m'
alias gp='git push -u origin (git symbolic-ref --short HEAD)'
alias gb='git branch'
alias gpl='git pull'
alias gf='git fetch'
alias gs='git stash'
alias gr='git rebase'
alias gt='git log --graph --oneline --all'
alias gsum='git summary'
alias gco='git checkout'
alias gignore='git update-index --assume-unchanged'
alias gnoignore='git update-index --no-assume-unchanged'
alias gclean='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
# alias end

# nvm start
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

export NVM_NODEJS_ORG_MIRROR=http://npm.taobao.org/mirrors/node
# nvm end

function conda
    set -l CONDA_EXE /usr/local/Caskroom/miniconda/base/bin/conda
    if [ (count $argv) -lt 1 ]
        $CONDA_EXE
    else
        set -l cmd $argv[1]
        set -e argv[1]
        switch $cmd
            case activate deactivate
                eval ($CONDA_EXE shell.fish $cmd $argv)
            case install update upgrade remove uninstall
                $CONDA_EXE $cmd $argv
                and eval ($CONDA_EXE shell.fish reactivate)
            case '*'
                $CONDA_EXE $cmd $argv
        end
    end
end

starship init fish | source
