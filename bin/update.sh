#!/bin/bash -exv
git submodule foreach git pull
git submodule foreach git submodule update --init --recursive

cd repos/YouCompleteMe
./install.sh
