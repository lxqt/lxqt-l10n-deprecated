cmake_minimum_required(VERSION 3.0.2 FATAL_ERROR)

project(lxqt-config)

option(WITH_LIBLXQT_CONFIG_CURSOR "Build liblxqt-config-cursor translations" ON)
option(WITH_LXQT_CONFIG_APPEARANCE "Build lxqt-config-appearance translations" ON)
option(WITH_LXQT_CONFIG_BRIGHTNESS "Build lxqt-config-brightness translations" ON)
option(WITH_LXQT_CONFIG_FILE_ASSOCIATIONS "Build lxqt-config-file-associations translations" ON)
option(WITH_LXQT_CONFIG_INPUT "Build lxqt-config-input translations" ON)
option(WITH_LXQT_CONFIG_LOCALE "Build lxqt-config-locale translations" ON)
option(WITH_LXQT_CONFIG_MONITOR "Build lxqt-config-monitor translations" ON)

build_component("lxqt-config" "")

#components
add_component(WITH_LIBLXQT_CONFIG_CURSOR liblxqt-config-cursor)
add_component(WITH_LXQT_CONFIG_APPEARANCE lxqt-config-appearance)
add_component(WITH_LXQT_CONFIG_BRIGHTNESS lxqt-config-brightness)
add_component(WITH_LXQT_CONFIG_FILE_ASSOCIATIONS lxqt-config-file-associations)
add_component(WITH_LXQT_CONFIG_INPUT lxqt-config-input)
add_component(WITH_LXQT_CONFIG_LOCALE lxqt-config-locale)
add_component(WITH_LXQT_CONFIG_MONITOR lxqt-config-monitor)

