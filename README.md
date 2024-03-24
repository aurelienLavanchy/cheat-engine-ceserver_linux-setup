# cheat-engine_linux-install-script

## Requirements

**If not already installed**

- curl
- make
- unzip
- wine (tested with 8.5+ staging)

## Usage

1. Allow script to be executable by either
   Typing `chmod u+x CE-install.sh`
   OR right-clicking on the script and selecting Properties > Permissions then ticking "[ ] Is executable"
2. Launch script via terminal
   In the directory the script is located: `./CE-install.sh`,
   proceed with the rest of the installation

## Notes / TODO

- Proper error handling
- This script downloads the source code archive in Cheat Engine's releases to build ceserver instead of cloning the repo, this is intended as ceserver's "version" must match Cheat Engine's in order to work properly (need confirmation)
- no user-defined install path => installs everything in $HOME/Cheat-Engine (for now)
