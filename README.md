# Apt backup

Save the list of installed Apt packages (full with version & state, package names only & manually installed only), Snap packages and the `/etc/apt` directory (except the GPG keys). Put the result in a Git repository & commit the changes.

Useful for checking the installed packages over time, and for moving to another installation.

## Usage

```bash
./update.sh
```

Create the backup into a directory specified in `apt-backup.cfg`. If the config file does not exist, it will be created. Default: `dir=backup`

```bash
./auto-update.sh
```

Run `./update.sh`, then make a Git commit with the current timestamp. If there is no Git repository in the pecified path, then it will be created.
