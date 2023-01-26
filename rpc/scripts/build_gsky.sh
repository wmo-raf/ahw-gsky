#!/bin/bash
set -xeu
gsky_repo="${1}"
gsky_branch="${2}"


if [ -z "$gsky_repo" ]
then
    echo "gsky repo required"
    exit 1
fi


C_INCLUDE_PATH=$(nc-config --includedir)
export C_INCLUDE_PATH

gsky_src_root=/gsky/gsky_src
mkdir -p $gsky_src_root

git clone "$gsky_repo" $gsky_src_root/gsky

(set -xeu
cd $gsky_src_root/gsky

if [ ! -z "$gsky_branch" ]
then
    git checkout "$gsky_branch"
fi

./configure --prefix=/gsky --bindir=/gsky/bin --sbindir=/gsky/bin --libexecdir=/gsky/bin
make all
make install
)