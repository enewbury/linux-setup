# @enewbury has dotfiles!

My preferred starting configuration for PopOS Desktop. Current version 20.10 

Run `script/setup.sh` to configure a new computer

Add or delete files in `script/install.sh` and `script/programs/` to modify your installation.

## Usage

After installing your fresh OS, do:

Load your `desktop-assets` into your `Downloads` directory.  For me, this includes a wallpaper, a hex config file, an NPM token, and ssh keys.

copy ssh keys

```sh
cp $HOME/Downloads/desktop-assets/id_ed25519 $HOME/.ssh/id_ed25519
    cp $HOME/Downloads/desktop-assets/id_ed25519.pub $HOME/.ssh/id_ed25519.pub
    ssh-add
```

```sh
git clone git@github.com:enewbury/dotfiles.git

# Or use HTTPS
git clone https://github.com/enewbury/dotfiles.git
```

Close Firefox if it's open, then run the installation script.

```sh
cd dotfiles
script/setup.sh
```

### Saving and loading configuration settings



Back up new settings with:

```sh
dconf dump /org/gnome/ > .config/dconf/settings.dconf
```

To load changes load `settings.dconf` with:

```sh
dconf load /org/gnome/ < .config/dconf/settings.dconf
```

Run `man dconf` on your machine for more.
