# cheat-engine_linux-install-script

## Status

❗Relatively untested but technically usable !

## Requirements

### If not already installed

- wget
- curl
- make
- unzip
- wine (tested with 8.5 staging)

## Usage

1. Allow script to be executable by either
  Typing `chmod u+x CE-install.sh`  
  OR right-clicking on the script and selecting Properties > Permissions then ticking "[ ] Is executable"
2. Launch script via terminal
  In the directory the script is located: `./CE-install.sh`,  
  proceed with the rest of the installation

## Notes / TODO

- **No error handling !** : <u>use at you own risks</u>
- This script downloads the source code archive in Cheat Engine's releases to build ceserver instead of cloning the repo, this is intended as ceserver's "version" must match Cheat Engine's in order to work properly (need confirmation)  
- /usr/bin/sh might not be the best way to go depending on your system (?)
- installs everything in $Home/Cheat-Engine, will change that behaviour when I figure out how to accept user input as a valid path
