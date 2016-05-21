# LXQt - translations

## Overview

This repository is providing translations of all components maintained by the LXQt project.

The transfer from the components' distinct repositories to this single one was made in order to ease handling the translations by systems like Pootle or Transifex.

There are two ways to make use of the translations summarized in this repository.   
Components can pull their translations from this repository at build time. This is enabled in all components by default.  
The repository can be built as a whole. This allows for using the translations without downloading at build time which in turn can mitigate restrictions of build systems. Building the repository as a whole can be favourable regarding performance as well. The repository itself is architecture agnostic so building it once will provide all translations which hence do not have to get compiled once per component and architecture.

## Usage

### General

Git, CMake, qttools and LXQt component [liblxqt](https://github.com/lxde/liblxqt) as well as its dependency [libqtxdg](https://github.com/lxde/libqtxdg) are needed to build translations from this repository, no matter whether components are acquiring the translations themselves or the repository is built as a whole.

### Pulling translations at build time

With regards to downstream packaging it's worth noting that the prerequisites stated above may have to be added to packages providing components like ComptonConf which don't need them at runtime and hence eventually didn't need them at all so far.

All components are by default pulling their translations at build time right now. This can be toggled by a boolean CMake variable `PULL_TRANSLATIONS`.

### Building the repository itself

A selection which components shall be considered can be made by a boolean CMake variable `WITH_<component>`, e. g. `WITH_LXQT_PANEL`. It defaults to `ON` for all components included in this repository. CMake variable `PULL_TRANSLATIONS` has to be set to `OFF` in all components which are meant to be covered by the translations repository as file conflicts will result otherwise.

To build run trias `cmake`, `make` and `make install` as usual. Make target install accepts a variable `DESTDIR=<path>`.
