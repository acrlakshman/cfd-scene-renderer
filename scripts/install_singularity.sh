echo "Installing go"

export VERSION=1.16.6 OS=linux ARCH=amd64 && \
    wget https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz && \
    mkdir -p $HOME/.local && \
    tar -C $HOME/.local -xzvf go$VERSION.$OS-$ARCH.tar.gz && \
    rm go$VERSION.$OS-$ARCH.tar.gz

echo 'export PATH=$HOME/.local/go/bin:$PATH' >> ~/.bashrc
export PATH=$HOME/.local/go/bin:$PATH

echo "Installing singularity"

sudo apt-get update && sudo apt-get install -y \
    build-essential \
    libssl-dev \
    uuid-dev \
    libgpgme11-dev \
    squashfs-tools \
    libseccomp-dev \
    wget \
    pkg-config \
    git \
    cryptsetup

export VERSION=3.8.1 && \
	wget https://github.com/sylabs/singularity/releases/download/v$VERSION/singularity-ce-$VERSION.tar.gz && \
	tar -xzf singularity-ce-$VERSION.tar.gz && rm singularity-ce-$VERSION.tar.gz && \
	cd singularity-ce-$VERSION && \
	./mconfig && \
	make -C builddir && \
	sudo make -C builddir install && \
	cd .. && rm -r singularity-ce-$VERSION
