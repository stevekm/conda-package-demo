# custom-package-0.1

This is the demo custom conda package.

This is meant to be used as a template and example for creating your own custom conda packages. 

# Contents

- `Makefile`: contains shortcuts to maintenance commands used by the developer for managing the package source

- `build.sh`: the script that conda uses to create the package from the source code extracted from the tar ball (e.g. `my_script.sh.tar.gz`). Importantly, this script's primary function is to copy the program's source code to the [`${PREFIX}/bin` location](https://conda.io/docs/user-guide/tasks/build-packages/environment-variables.html#environment-variables-set-during-the-build-process). 

- `meta.yaml`: meta data file used by conda during package installation. Importantly, it contains a URL to the program's source `.tar.gz` file, which will be extracted automatically.

- `my_script.sh`: the sole content of this demo package. This script is used to illustrate how you can put custom content into a conda package, making it accessible from your `PATH` after loading the package through conda.

- `my_script.sh.tar.gz`: tar ball of the package source code (e.g. `my_script.sh`). The URL to this file hosted on Github is used in `meta.yaml` to download the package source code.

- `run_test.sh`: (optional) the default test script that conda will use to verify that the package was installed correctly. This script should perform some action that verifies the correct installation of the package, and exit with status 0 if successful, or exit with a non-zero value if unsuccessful. In this case, the script calls `my_script.sh`, which should be accessible through the `PATH`, and checks that its output matches the expected value.

