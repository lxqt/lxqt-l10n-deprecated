cmake_minimum_required(VERSION 3.0.2 FATAL_ERROR)

project(lxqt-session)

option(WITH_LXQT_CONFIG_SESSION "Build lxqt-config-session translations" ON)
option(WITH_LXQT_LEAVE "Build lxqt-leave translations" ON)

build_component("lxqt-session" "")

#components
add_component(WITH_LXQT_CONFIG_SESSION lxqt-config-session)
add_component(WITH_LXQT_LEAVE lxqt-leave)

