#!/usr/bin/env zsh

function zaw-src-vsts() {
    if which jq 1>/dev/null || brew install jq 2>dev/null

    ${ZAW_VSTS_INSTANCE:=`vsts configure -l | grep instance | awk '{ print $NF }'`}
    ${ZAW_VSTS_CLONE_METHOD:='ssh'}

    candidates=("${(@f)$(vsts project list --instance $ZAW_VSTS_INSTANCE --output json | jq --raw-output '.[].name')}")

    if which ghq 1>/dev/null; then
        actions=('zaw-src-vsts-ghq')
        act_descriptions=('ghq get')
    fi

    actions+=('zaw-src-vsts-clone' 'zaw-src-vsts-browse' 'zaw-callback-append-to-buffer' 'zaw-callback-replace-buffer')
    act_descriptions+=('git clone' 'browse' 'append to edit buffer' 'replace edit buffer')
}

function zaw-src-vsts-ghq() {
    local list=`vsts code repo list --instance $ZAW_VSTS_INSTANCE --output json --project "${(j:; :)@}"`
    [[ $ZAW_VSTS_CLONE_METHOD == 'ssh' ]] && local url=`echo $list | jq --raw-output '.[0].additionalProperties.sshUrl'` || local url=`echo $list | jq --raw-output '.[0].remoteUrl'`
    BUFFER="ghq get $url"
    zle accept-line
}

function zaw-src-vsts-clone() {
    local list=`vsts code repo list --instance $ZAW_VSTS_INSTANCE --output json --project "${(j:; :)@}"`
    [[ $ZAW_VSTS_CLONE_METHOD == 'ssh' ]] && local url=`echo $list | jq --raw-output '.[0].additionalProperties.sshUrl'` || local url=`echo $list | jq --raw-output '.[0].remoteUrl'`
    BUFFER="git clone $url"
    zle accept-line
}

function zaw-src-vsts-browse() {
    local encoded=`echo ${(j:; :)@} | nkf -WwMQ | tr = %`
    BUFFER="open https://generald.visualstudio.com/$encoded"
    zle accept-line
}

zaw-register-src -n visual-studio-team-services zaw-src-vsts
