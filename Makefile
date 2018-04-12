SHELL:=/bin/bash
MINICONDA_sh:=Miniconda3-4.4.10-MacOSX-x86_64.sh
MINICONDA_sh_url:=https://repo.continuum.io/miniconda/$(MINICONDA_sh)
MINICONDA_sh_md5:=268ec716435aa19212901510f00815fd
CONDA_INSTALL_DIR:=$(shell pwd)/conda
CONDA_ACTIVATE:=$(CONDA_INSTALL_DIR)/bin/activate

none:

$(MINICONDA_sh):
	wget "$(MINICONDA_sh_url)"

dl: $(MINICONDA_sh)

$(CONDA_INSTALL_DIR): dl
	bash "$(MINICONDA_sh)" -b -p "$(CONDA_INSTALL_DIR)"

# install conda in the current directory and install the conda-build package to it
install: $(CONDA_INSTALL_DIR)
	source "$(CONDA_ACTIVATE)" && \
	conda install -y conda-build

# build the custom conda package and create a new env using it
custom: install
	source $(CONDA_ACTIVATE) && \
	conda-build custom-package-0.1 && \
	conda create -y -c local -n custom-package-0.1 custom-package==0.1

clean:
	[ -d "$(CONDA_INSTALL_DIR)" ] && mv "$(CONDA_INSTALL_DIR)" old_conda && rm -rf old_conda &
	rm -f "$(MINICONDA_sh)"
