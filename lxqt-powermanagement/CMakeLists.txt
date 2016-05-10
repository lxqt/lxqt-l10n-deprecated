cmake_minimum_required(VERSION 3.0.2 FATAL_ERROR)

project(lxqt-powermanagement)

option(WITH_LXQT_CONFIG_POWERMANAGEMENT "Build lxqt-config-powermanagement translations" ON)

build_component("lxqt-powermanagement" "")

#components
add_component(WITH_LXQT_CONFIG_POWERMANAGEMENT lxqt-config-powermanagement)

