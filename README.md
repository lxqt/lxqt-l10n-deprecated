# lxqt-l10n

**Note:**
This is deprecated. Use https://weblate.lxqt.org or the repositories
directly to update the translations.

## Overview

This repository is providing translations ("localization") in terms of the Qt
[TS files](http://doc.qt.io/qt-5/linguist-ts-file-format.html) of all components
maintained by the LXQt project.

The transfer from the components' distinct repositories to this single one was
made in order to ease handling the translations by systems like Pootle or Transifex
which is the long-term goal.

Desktop Entry files (`*.desktop`) remain in the distinct components' repositories
for the time being as these are not yet covered by Pootle or Transifex anyway.

There are two ways to make use of the translations summarized in this repository.
Components can pull their translations from this repository at build time. This
is what all components covered by this repository are doing by default right now.
The repository can be built independently of the other components. This allows
for building the translations without downloading at build time which in turn can
mitigate restrictions of build systems. Building the repository that way can be
favourable regarding performance as well as the repository itself is architecture
agnostic so translations have to be built once only instead of one time per
component and architecture. The repository can be built as a whole, splitting
into several packages is possible as well.

## Compiling

### General

Git, CMake, qttools and LXQt component
[lxqt-build-tools](https://github.com/lxqt/lxqt-build-tools) are needed to build
translations from this repository, no matter whether components are pulling from
this repository or the repository is built itself.

### Pulling translations at build time

With regards to downstream packaging it's worth noting that the prerequisites
stated above may have to be added to packages providing components like ComptonConf
which don't need them at runtime and hence eventually didn't need them at all so far.

All components are by default pulling their translations at build time right now.
This can be toggled by a boolean CMake variable `PULL_TRANSLATIONS`.

### Building the repository itself

A selection which components shall be considered can be made by a boolean CMake
variable `WITH_<component>`, e. g. `WITH_LXQT_PANEL`. It defaults to `ON` for all
components included in this repository. CMake variable `PULL_TRANSLATIONS` as stated
above has to be set to `OFF` in all components which are meant to be covered by
repository lxqt-l10n as file conflicts will result otherwise.

To build run trias `cmake`, `make` and `make install` as usual. Make target install
accepts a variable `DESTDIR=<path>`.

### Note for packagers

To correctly run localized Qt application there is always good to have the Qt(core)
translations installed. With them present in runtime we can avoid various
misfunctionalities as e.g. [not working shortcuts](https://github.com/lxqt/pcmanfm-qt/issues/401).
Then for packager it is a good habit to state at least soft runtime dependency
("recommend") to Qt(core) translations for all packages made from this repository.

## Contributing

As tools like Pootle or Transifex haven't been implemented yet we have to ask users
to take a not too convenient approach which involves dealing with local source code
checkouts.
It is depicted in wiki page [Translation](https://github.com/lxqt/lxqt/wiki/Translation).
