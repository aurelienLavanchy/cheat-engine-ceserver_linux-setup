#! /usr/bin/bash

# variables
version=$(curl -Is https://github.com/cheat-engine/cheat-engine/releases/latest | awk -F '/' '/^location/ {print substr($NF, 1, length($NF-1))}')    # source: https://gist.github.com/steinwaywhw/a4cd19cda655b8249d908261a62687f8?permalink_comment_id=4411890#gistcomment-4411890
dl_version=$(echo "$version" | sed -e 's/\.//g')
# bin_install_path="/usr/bin"
temp_path=$HOME/cheat-engine-temp
if [ -d "$temp_path" ]; then
  mkdir "$temp_path"
fi

## Installation
# 1. Grabbing the source code archive from the latest release
cd "$temp_path" || error "$temp_path does not exist or was not found" && exit 1
curl "https://github.com/cheat-engine/cheat-engine/archive/refs/tags/$version.zip" -O "cheat-engine-$version.zip"
unzip "cheat-engine-$version.zip"

# 2. Building ceserver and 'installing' it
cd "cheat-engine-$version/Cheat Engine/ceserver/gcc" || error "Was the release archive decompressed properly?" && exit 2
make --quiet > /dev/null 2>&1    # silence make errors and warnings
mkdir "$HOME/Cheat-Engine"
mv ceserver ~/Cheat-Engine || error "ceserver was not found, did make correctly build Cheat Engine ?" && exit 3
# echo "ceserver resides in $HOME/Cheat-Engine do you want to make it available globally ? (create a symlink to $bin_install_path)"

# cleaning up
cd - || exit 9
rm -rf "cheat-engine-$version" && rm "cheat-engine-$version.zip"

# installing cheat engine
curl "https://github.com/cheat-engine/cheat-engine/releases/download/$version/CheatEngine$dl_version.exe"
WINEPREFIX="$HOME/Cheat-Engine" wine "$HOME/Documents/cheat-engine-temp/CheatEngine$dl_version.exe"

# wrapping-up the installation
cd "$HOME" || exit 9
rm -rf "cheat-engine-temp"
printf "\n" && echo "Done! Don't forget to launch ceserver before trying to connect to it in Cheat Engine"

exit 0