cmake_minimum_required(VERSION 3.0.2 FATAL_ERROR)

project(lxqt-notificationd)

option(WITH_LXQT_CONFIG_NOTIFICATIOND "Build lxqt-config-notificationd translations" ON)

build_component("lxqt-notificationd" "")

#components
add_component(WITH_LXQT_CONFIG_NOTIFICATIOND lxqt-config-notificationd)

