#!/usr/bin/env bash
eval "$(conda shell.bash hook)"
conda env create -f update.yaml
conda activate pbsv-update
conda env export > environment.yaml
conda deactivate
conda env remove -n pbsv-update
