LXQt - translations
===

## About this repository
This is repository with translations of all **LXQt** components (like lxqt-panel, lxqt-runner etc.). All these translations can be build on their own (for downstream packaging) or can be pulled (and built) into component's source directory during the cmake phase of component's build (cmake's *PULL\_TRANSLATIONS* parameter).

## Build example (e.g. install just panel's translations)

    git clone https://github.com/lxde/translations.git
    cd translations
    mkdir build
    cd build
    cmake ..
    make
    make install-lxqt-panel
