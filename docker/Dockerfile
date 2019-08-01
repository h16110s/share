FROM nvidia/cuda:10.0-cudnn7-devel
# FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV HOME /root

# libopencv-dev はgitの前にインストールしないとbuildが止まるらしい
RUN apt -y update  && \
    apt install -y \
        build-essential \
        apt-utils \ 
        libreadline-dev \
        libncursesw5-dev \
        libssl-dev \
        libsqlite3-dev \
        libgdbm-dev \
        libbz2-dev \
        liblzma-dev \
        zlib1g-dev \
        uuid-dev \
        libffi-dev \
        libdb-dev \ 
        libopencv-dev \
        wget \
        curl \
        git \ 
        vim \ 
        graphviz \
        && apt clean \
        && rm -rf /var/lib/apt/lists/* 

# # 各環境変数を設定
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH ${PYENV_ROOT}/bin:$PATH
ENV PATH ${PYENV_ROOT}/shims:$PATH

RUN echo "PS1='\[\e[1;31m\]\u@\[\e[0;34m\]\h:\$\[\e[0;37m\] '" >> ${HOME}/.bash_profile && \
    git clone https://github.com/pyenv/pyenv.git ${HOME}/.pyenv && \
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ${HOME}/.bash_profile && \
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ${HOME}/.bash_profile && \
    echo 'eval "$(pyenv init -)"' >> ${HOME}/.bash_profile 

RUN pyenv install 2.7.16 
RUN pyenv global 2.7.16 
RUN python -m pip install --upgrade pip  && \
    pip install numpy&& \
    pip install scipy&& \
    pip install matplotlib&& \
    pip install Pillow&& \
    pip install ipython[all] && \
    pip install tensorflow-gpu && \
    pip install keras && \
    python -m ipykernel install --user

RUN pyenv install 3.6.3 
RUN pyenv global 3.6.3 
RUN python -m pip install --upgrade pip  && \
    pip install numpy&& \
    pip install scipy&& \
    pip install matplotlib&& \
    pip install Pillow&& \
    pip install ipython[all] && \
    pip install tensorflow-gpu && \
    pip install keras && \
    pip install jupyter && \
    pip install pydot && \
    pip install opencv-python && \
    pip install sklearn && \
    pip install tqdm && \
    pip install jupyterthemes && \
    jt -t oceans16 -f inconsolata -N -T 

COPY ./conf/jupyter ${HOME}/.jupyter

WORKDIR ${HOME}
ENTRYPOINT [ "/bin/bash", "--login" ]
