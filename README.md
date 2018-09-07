# zaw-src-vsts

Optional sources of [zaw](https://github.com/zsh-users/zaw) for Visual Studio Team Services.

It shows list of your repositories on Visual Studio Team Service and clones repo you choose.

## Installation

If you are using zplug, just add the code below in your .zshrc.

```zsh
zplug "zsh-users/zaw"
zplug "GeneralD/zaw-src-vsts", on:zsh-users/zaw, defer:2
```

For oh-my-zsh, clone this repo into ~/.oh-my-zsh/custom/plugins and add plugin as below.

```zsh
plugins+=(zaw zaw-src-vsts)
```

## Configuration

If you have a config file ~/.vsts/cli/config, instance will be loaded from it.

Furthermore, you can override if you want.

```zsh
ZAW_VSTS_INSTANCE='https://username.visualstudio.com'
ZAW_VSTS_CLONE_METHOD='https' # default is 'ssh'
```

## Dependencies

- jq
- vsts

If you are using macOS, you can install with,

```sh
brew install jq
brew install vsts-cli
```
