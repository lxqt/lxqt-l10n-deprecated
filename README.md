# LXQt - translations

## Overview

This repository is providing translations of all components maintained by the LXQt project. The transfer from the components' repositories to this repository was made in order to ease handling the translations by systems like Pootle or Transifex.

There are two ways to use this repository. Components can pull their translations at build time and the repository can get built itself.

## Pulling translations at build time

Components will be able to pull their translations from this repository during the CMake invocation.

This will be handled by a boolean CMake variable `PULL_TRANSLATIONS` which will probably be enabled by default.

Note this variable isn't implemented in all components yet.

## Building the repository itself

The repository can get built itself as well. This can be useful to avoid downloading translations at build time which in turn can mitigate restrictions of build systems.   
CMake variable `PULL_TRANSLATIONS` has to be disabled as file conflicts will result otherwise.

Aside from [CMake](https://cmake.org) LXQt component [liblxqt](https://github.com/lxde/liblxqt), its dependency [libqtxdg](https://github.com/lxde/libqtxdg) and qttools are needed.   
Once these requirements are met the repository can be built by running the usual trias `cmake`, `make` and `make install` where the latter accepts a variable `DESTDIR=<path>`.   
A selection which components shall be considered can be made by a boolean CMake variable `WITH_<component>`, e. g. `WITH_LXQT_PANEL`.
