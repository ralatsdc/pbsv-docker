# TODO: Understand this comment
# Full contents of Dockerfile
# See: https://hub.docker.com/r/continuumio/miniconda3
# Base image latest
FROM continuumio/miniconda3
LABEL description="Base docker image with conda and util libraries"
ARG ENV_NAME="pbsv"

# Install the conda environment
COPY environment.yml /
RUN conda env create --quiet --name ${ENV_NAME} --file /environment.yml && \
    conda clean -a

# Add conda installation dir to PATH (instead of doing 'conda activate')
ENV PATH /opt/conda/envs/${ENV_NAME}/bin:$PATH

# Install procps so that Nextflow can poll CPU usage
RUN apt-get update && \
    apt-get install -y procps && \
    apt-get clean -y

# TODO: Understand why this is needed
ENV PATH="${PATH}:/root"
