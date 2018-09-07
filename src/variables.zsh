#!/usr/bin/env zsh

ZAW_VSTS_INSTANCE=${ZAW_VSTS_INSTANCE:-`vsts configure -l | \grep instance | \awk '{ print $NF }'`} # set yours
ZAW_VSTS_CLONE_METHOD=${ZAW_VSTS_CLONE_METHOD:-'ssh'} # ssh or https
