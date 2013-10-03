#!/bin/bash -e
set -xv
pushd ~/

if ! test -e ~/.vim; then
    test -f ~/.vimrc && mv .vimrc .vim/
    test -d ~/.vim && mv .vim .vim.sav
    git clone git://github.com/akatrevorjay/dotfiles-vim.git .vim
    ln -s .vim/vimrc .vimrc
    pushd .vim
else
    pushd .vim
    git pull
fi

git submodule update --init --recursive

pushd ./repos/powerline/
python ./setup.py develop || sudo python ./setup.py develop || echo "Failed to install powerline" >&2
popd

pushd ./repos/jedi-vim/jedi
python ./setup.py develop || sudo python ./setup.py develop || echo "Failed to install jedi" >&2
popd

popd

popd
set +xv
echo enjoy
