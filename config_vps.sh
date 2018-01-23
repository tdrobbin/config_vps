#!/bin/bash

# set and persist sda_bas env var to use by other apps
# export SDA_BASE = $HOME/sda_base
echo 'running script to configure new server for sda production'

echo export SDA_BASE=$HOME/sda_base >> $HOME/.bashrc
echo export SUPERVISOR_BASE=$HOME/supervisor_base >> $HOME/.bashrc
echo export SUPERSET_BASE=$HOME/superset_base >> $HOME/.bashrc

source $HOME/.bashrc

# install miniconda
# choose all default settings so everything after works
echo 'installing miniconda'
curl -O https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
echo 'installation done'

# add conda to path
echo export PATH=$PATH:$HOME/miniconda3/bin >> $HOME/.bashrc

# activate installation
source $HOME/.bashrc

# install conda environments
# conda create -n py3 python=3

# activate and run simpler server
# source activate py3
# python -c "import sys; print(sys.executable)"

# download sdacore
git clone https://gitlab.com/tdrobbin/sys.git

# download sda prod
git clone https://gitlab.com/tdrobbin/sdaprod.git

# download sda prod
# git clone https://gitlab.com/tdrobbin/sdaprod_data.git

# add both to pythonpath
echo export PYTHONPATH=$PYTHONPATH:$HOME/sdacore >> $HOME/.bashrc
echo export PYTHONPATH=$PYTHONPATH:$HOME/sdaprod >> $HOME/.bashrc

# activate installation
source $HOME/.bashrc

# create all conda envs
conda env create -f $HOME/sdaprod/sdaprod_env.yml
# conda env create -f $HOME/sdaprod/supervisor_env.yml

# source activate sdaprod

# cd sdaprod_data


# https://superset.incubator.apache.org/installation.html
sudo apt-get install build-essential libssl-dev libffi-dev python-dev python-pip libsasl2-dev libldap2-dev

# install superset
conda create -n superset python=3
conda activate superset
pip install superset

conda create -n supervisor python=2 supervisor
# pip install supervisor

# Install superset
# pip install superset
conda activate superset

# Create an admin user (you will be prompted to set username, first and last name before setting a password)
fabmanager create-admin --app superset

# Initialize the database
superset db upgrade

# Load some data to play with
superset load_examples

# Create default roles and permissions
superset init

# create and activate supervisor
cd sdaprod
source activate supervisor





