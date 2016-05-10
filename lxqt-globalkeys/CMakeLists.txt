cmake_minimum_required(VERSION 3.0.2 FATAL_ERROR)

project(lxqt-globalkeys)

option(WITH_LXQT_CONFIG_GLOBALKEYSHORTCUTS "Build lxqt-config-globalkeyshortcuts translations" ON)

#components
add_component(WITH_LXQT_CONFIG_GLOBALKEYSHORTCUTS lxqt-config-globalkeyshortcuts)

