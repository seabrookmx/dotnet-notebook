# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG BASE_CONTAINER=jupyter/base-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Jupyter Project <jupyter@googlegroups.com>"

USER root

# Install all OS dependencies for fully functional notebook server, including dotnet repos
RUN apt-get update && apt-get install -yq software-properties-common wget && \
    wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    add-apt-repository universe && apt-get update && apt-get install -yq --no-install-recommends \
    apt-transport-https \
    dotnet-sdk-3.0 \
    build-essential \
    emacs \
    git \
    inkscape \
    jed \
    libsm6 \
    libxext-dev \
    libxrender1 \
    lmodern \
    netcat \
    pandoc \
    python-dev \
    texlive-fonts-extra \
    texlive-fonts-recommended \
    texlive-generic-recommended \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-xetex \
    tzdata \
    unzip \
    nano \
    && apt-get clean && rm -rf /var/lib/apt/lists/* && rm packages-microsoft-prod.deb

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID

ENV PATH="${PATH}:/home/jovyan/.dotnet/tools"

# Set up dotnet jupyter kernel
RUN dotnet tool install -g dotnet-try && \
    dotnet try jupyter install && \
    jupyter kernelspec list

