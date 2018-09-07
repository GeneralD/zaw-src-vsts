#!/usr/bin/env zsh

ZAW_VSTS_INSTANCE=${ZAW_VSTS_INSTANCE:-`vsts configure -l | /usr/bin/grep
 instance | /usr/bin/awk '{ print $NF }'`}
ZAW_VSTS_CLONE_METHOD=${ZAW_VSTS_CLONE_METHOD:-'ssh'} # ssh or https
