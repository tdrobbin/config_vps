#!/bin/bash

# set and persist sda_bas env var to use by other apps
# export SDA_BASE = $HOME/sda_base
echo export SDA_BASE=$HOME/sda_base >> $HOME/.bashrc
source $HOME/.bashrc

# install miniconda
curl -O https://repo.continuum.io/miniconda/Miniconda2-4.3.31-Linux-x86_64.sh
source Miniconda2-4.3.31-Linux-x86_64.sh

# activate installation
source $HOME/.bashrc

# install conda environments
conda create -n py3 python=3

# activate and run simpler server
conda activate py3
python -c "import sys; print(sys.executable)"
