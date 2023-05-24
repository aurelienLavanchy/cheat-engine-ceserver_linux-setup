#! /usr/bin/sh
echo "Enter the desired path for Cheat Engine (that doesn't require root privilege because I'm bad at writing scripts)"
read install_path
version = curl -Is https://github.com/cheat-engine/cheat-engine/releases/latest | awk -F '/' '/^location/ {print substr($NF, 1, length($NF-1))}'    # source: https://gist.github.com/steinwaywhw/a4cd19cda655b8249d908261a62687f8?permalink_comment_id=4411890#gistcomment-4411890

cd $install_path
wget https://github.com/cheat-engine/cheat-engine/archive/refs/tags/$version.zip
unzip cheat-engine-$version.zip

cd 'cheat-engine-$version/Cheat Engine/ceserver/gcc'
make
mv ceserver $install_path

cd ../../../../..
rm -rf cheat-engine-$version && rm cheat-engine-$version.zip

wget https://github.com/cheat-engine/cheat-engine/releases/download/$version/CheatEngine$version.exe
# install Cheat Engine via Lutris
