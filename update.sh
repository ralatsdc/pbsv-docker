#!/usr/bin/env bash
eval "$(conda shell.bash hook)"
conda env create -f update.yaml
conda activate pbsv
conda env export | grep -v prefix > environment.yaml
conda deactivate
conda env remove -n pbsv
