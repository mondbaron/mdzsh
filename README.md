## MDZSH Installation Skript

A single-shot installation script to populate a powerful ZSH configuration on Debian based systems.

The script configures/installs:
- ZSH (`zsh`) and prerequisites (`curl`, `git`, `fonts-powerline`) via `apt`
- [Oh My Zsh](https://ohmyz.sh) managing framework via `curl`
- Plugins:
    - extract
    - rsync
    - git
    - python 
    - pip 
    - virtualenv
    - [zsh-autocomplete](https://github.com/marlonrichert/zsh-autocomplete) via `git`
    - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) via `git`
    - [zsh-completions](https://github.com/zsh-users/zsh-completions) via `git`
    - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) via `git`
- Themes: 
    - [Powerlevel10k](https://github.com/romkatv/powerlevel10k) via `git`

### Installation

```sh
sh -c "$(curl -fsSL https://raw.github.com/mondbaron/mdzsh/master/install.sh)"
```
