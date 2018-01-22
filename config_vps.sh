#!/bin/bash

# set and persist sda_bas env var to use by other apps
# export SDA_BASE = $HOME/sda_base
echo export SDA_BASE=$HOME/sda_base >> $HOME/.bashrc
source $HOME/.bashrc

# install miniconda
# choose all default settings so everything after works
curl -O https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh

# add conda to path
echo export PATH=$PATH:$HOME/miniconda3/bin >> $HOME/.bashrc

# activate installation
source $HOME/.bashrc

# install conda environments
conda create -n py3 python=3

# activate and run simpler server
conda activate py3
python -c "import sys; print(sys.executable)"
