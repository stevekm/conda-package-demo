# conda-package-demo
Creating a conda env from a custom package.

This demo illustrates the steps required to create a custom conda package from non-Python programs. 

# Contents

Files in this repository:

- `Makefile`: shortcuts to commands for configuring and installing Miniconda and packages

- `custom-package-0.1`: directory containing custom conda package (includes `README.md` file with contents description)

- `custom.yml`: YAML file used to create a conda env from the custom package

## custom-package-0.1

The sole content of this demo custom package is the script `my_script.sh`, which will be made accessible from your `PATH`. 

# Usage

Clone this repository

```
git clone https://github.com/stevekm/conda-package-demo.git
cd conda-package-demo
```

Create the custom env from the custom package

```
make custom
```

or

```
make custom-yaml
```

This will:

- download a copy of the Minconda installer to your current directory (`Miniconda3-4.4.10-MacOSX-x86_64.sh` used by default)

- create a directory called `conda` in the current directory and install conda to that location

- build the custom package in the `custom-package-0.1` directory

- create a conda env called `custom-package-0.1` from the package

Test the new env

```
make test
```

- output should look like this:

```
$ make test
source /Users/steve/projects/conda-package-demo/conda/bin/activate custom-package-0.1 && \
	my_script.sh
This is the custom package script!
```

# Resources

- Miniconda installer archive: https://repo.continuum.io/miniconda/

- Building conda packages: https://conda.io/docs/user-guide/tasks/build-packages/index.html

# Software

- conda (Miniconda 3 used here)

- your programs

- this demo uses `bash` to install the macOS version of Miniconda (you can change this in the Makefile)
