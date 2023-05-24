# cheat-engine_linux-install-script

## Status

❗Not currently usable ! (and relatively untested)

## Requirements

### If not already installed

- wget
- curl
- make
- unzip
- Lutris

## Usage

1. Allow script to be executable by either:  
  Typing `chmod u+x CE-install.sh`  
  or right-clicking on the script and selecting Properties > Permissions then ticking "[ ] Is executable"
2. Launch script via terminal:
  In the directory the script is located `./CE-install.sh`,  
  type the desired installation path when prompted (then wait for installation to complete)

## Notes / TODO

No error handling ! : avoid typing a path with spaces without surrounding it with quotes (`'` or `"`) or escaping spaces (`\ `)  
The $install_path is used to store and manipulate the files (archive / executable / ...) which is not ideal moving forward, as installing ceserver to /usr/bin might be preferable over pointing to a loose executable  
This script downloads the source code archive in Cheat Engine's releases for ceserver, this is intended as ceserver's "version" must match Cheat Engine's (to confirm)  
