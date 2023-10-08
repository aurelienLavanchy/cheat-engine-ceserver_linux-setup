#! /usr/bin/sh

# initial setup
version=$(curl -Is https://github.com/cheat-engine/cheat-engine/releases/latest | awk -F '/' '/^location/ {print substr($NF, 1, length($NF-1))}')    # source: https://gist.github.com/steinwaywhw/a4cd19cda655b8249d908261a62687f8?permalink_comment_id=4411890#gistcomment-4411890
dl_version=$(echo "$version" | sed -e 's/\.//g')
temp_path=$HOME/Documents/cheat-engine-temp
# add a check to remove existing $temp_path
mkdir "$temp_path"

# grabbing the source code archive from the latest realease
cd "$temp_path" || exit
wget "https://github.com/cheat-engine/cheat-engine/archive/refs/tags/$version.zip" -O "cheat-engine-$version.zip"
unzip "cheat-engine-$version.zip"

# building ceserver and installing it
cd "cheat-engine-$version/Cheat Engine/ceserver/gcc" || exit
make --quiet > /dev/null 2>&1    # silence make errors and warnings
mkdir "$HOME/Cheat-Engine"
mv ceserver ~/Cheat-Engine || exit

# cleaning up
cd - || exit
rm -rf "cheat-engine-$version" && rm "cheat-engine-$version.zip"

# installing cheat engine
wget "https://github.com/cheat-engine/cheat-engine/releases/download/$version/CheatEngine$dl_version.exe"
WINEPREFIX="$HOME/Cheat-Engine" wine "$HOME/Documents/cheat-engine-temp/CheatEngine$dl_version.exe"

# wrapping-up the installation
cd "$HOME/Documents" || exit
rm -rf "cheat-engine-temp"
printf "\n" && echo "Done!"
