# machinist

Bootstrap a new Ubuntu machine and manage shell environment vars.

## Bootstrap

On a fresh machine:
```bash
curl -sSf https://raw.githubusercontent.com/fluid-notion-labs/machinist/main/bootstrap.sh | bash
```

Or manually:
```bash
sudo apt install -y git
git clone https://github.com/fluid-notion-labs/machinist ~/.local/share/machinist
cd ~/.local/share/machinist
chmod +x install.sh installers/*.sh
./install.sh
```

## Usage

```bash
git clone https://github.com/fluid-notion-labs/machinist
cd machinist
chmod +x install.sh installers/*.sh
./install.sh
```

`install.sh` will:
- Install apt, cargo, node, uv packages
- Add `source ~/machinist/lib/config.sh` to `.bashrc`

## Structure

```
config.d/
  00-init.sh      # base PATH, XDG vars
  10-rust.sh      # CARGO_HOME, rustup
  20-node.sh      # NVM_DIR, nvm
  30-uv.sh        # UV_HOME, uv
  99-local.sh     # machine-specific overrides (gitignored)

lib/
  config.sh       # sources all config.d/*.sh in order

installers/
  apt.sh          # apt packages
  rustup.sh       # installs rustup
  rust.sh         # cargo packages
  nvm.sh          # installs nvm + LTS node
  node.sh         # npm globals
  uv.sh           # installs uv
  uv-tools.sh     # uv tool installs
  dconf.sh        # applies dotfiles/dconf.ini

packages/
  apt.txt
  cargo.txt
  node.txt
  uv.txt

dotfiles/
  dconf.ini       # gitignored, generate with: dconf dump / > dotfiles/dconf.ini
```

## Shell env

`.bashrc` sources `lib/config.sh` which loads all `config.d/` files in numeric order.
Add machine-specific vars to `config.d/99-local.sh` (gitignored).

## Saving dconf

On a configured machine:
```bash
dconf dump / > dotfiles/dconf.ini
git add -A && git commit -m "update dconf" && git push
```
