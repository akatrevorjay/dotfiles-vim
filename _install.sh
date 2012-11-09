#!/bin/bash -e
set -xv

cd
mv .vimrc .vim/
mv .vim .vim.sav
git clone git://github.com/akatrevorjay/dotfiles-vim.git .vim
ln -s .vim/vimrc .vimrc
cd .vim
git submodule update --init --recursive

set +xv
echo enjoy

