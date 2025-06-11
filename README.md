# dotfiles

Managed by [chezmoi](https://www.chezmoi.io).

## Setup

As admin user:

```bash
sudo sysadminctl -addUser Development -fullName "Development" -shell /bin/zsh
sudo sysadminctl -addUser Personal -fullName "Personal" -shell /bin/zsh
sudo sysadminctl -addUser Brew -fullName "Brew" -shell /bin/zsh
sudo passwd Development
sudo passwd Personal
sudo passwd Brew
sudo dscl . create /Users/Brew IsHidden 1
echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells
```

As Brew user:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply cedws
chsh -s /opt/homebrew/bin/fish Development
chsh -s /opt/homebrew/bin/fish Personal
chsh -s /opt/homebrew/bin/fish Brew
```
