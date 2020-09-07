# vip-project
Overarching project repo to organize submodules and functionality

## Getting Started

To create a local copy of the latest version of project and the latest version of all submodules:

```bash
git clone https://github.com/VentilatorsInPeoria/vip-project.git
cd vip-project/
./refresh-git-submodules.sh
```

To get started with development, you will want to initialize the workspace. The scripts in the root directory of the vip-project will do all work inside of the workspace/ directory. This will keep the source code directories pristine.

```bash
./initialize-workspace.sh
```

At any time, you may remove all contents of the workspace and start fresh. Note that the Arduino library dependencies that get installed are located outside the workspace. To remove these, please use the appropriate script within the Arduino source directory.

```bash
./purge-workspace.sh
```

## Script Guide

### Arduino BagTest

To install the latest library dependencies and compile the BagTest source code, run the following:

```bash
./compile-BagTest.sh
```

As the checking of the library dependencies takes longer than the compilation itself, there is an optional parameter to skip the dependency step:

```bash
./compile-BagTest.sh  --skip-deps
```

The code can then be uploaded to the Arduino Mega unit as follows:

```bash
./upload-BagTest.sh [arduino-programming-port]
```

A common pattern for quick compilation/upload could look like the following:

```bash
./compile-BagTest.sh --skip-deps && ./upload-BagTest.sh /dev/ttyACM0
```

Once the test code is uploaded to the Arduino, tests can be performed using this script:

```
./test-BagTest.sh [arduino-serial-port]
# Example
./test-BagTest.sh /dev/ttyUSB0
```

### Python3 pyBagPlot

After making changes to the pyBagPlot code, you can check that it meets static code analysis standards by running the following. This will invoke Tox, a tool which installs the package into an isolated environment before doing the static analysis:

```bash
./validate-pyBagPlot.sh
```

Once you are comfortable with the pyBagPlot code, it can be launched using this command:

```bash
./run-pyBagPlot.sh
```

## Data and Documentation

Separate repos have been created to house the data and documentation files from these applications. By storing the test data (inputs and outputs) in these data submodules, we can reduce the number of commits made to the source repos. Documentation related to the functionality and usage of the source code should still reside in the same repo as the source code. In the case where we have relating documents from outside organizations, we can put those into the appropriate documentation submodules to help avoid licensing issues.