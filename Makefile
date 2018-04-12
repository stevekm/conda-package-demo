SHELL:=/bin/bash
MINICONDA_sh:=Miniconda3-4.4.10-MacOSX-x86_64.sh
MINICONDA_sh_url:=https://repo.continuum.io/miniconda/$(MINICONDA_sh)
MINICONDA_sh_md5:=268ec716435aa19212901510f00815fd
CONDA_INSTALL_DIR:=$(shell pwd)/conda
CONDA_ACTIVATE:=$(CONDA_INSTALL_DIR)/bin/activate

$(MINICONDA_sh):
	wget "$(MINICONDA_sh_url)"

dl: $(MINICONDA_sh)

install: dl
	bash "$(MINICONDA_sh)" -b -p "$(CONDA_INSTALL_DIR)"

conda-build:
	source "$(CONDA_ACTIVATE)" && \
	conda install -y conda-build


clean:
	rm -rf "$(CONDA_INSTALL_DIR)"
	rm -f "$(MINICONDA_sh)"
