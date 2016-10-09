cmake_minimum_required(VERSION 3.0.2 FATAL_ERROR)

project(lxqt-admin)

option(WITH_LXQT_ADMIN_TIME "Build lxqt-admin-time translations" ON)
option(WITH_LXQT_ADMIN_USER "Build lxqt-admin-user translations" ON)

#components
add_component(WITH_LXQT_ADMIN_USER lxqt-admin-user)
add_component(WITH_LXQT_ADMIN_TIME lxqt-admin-time)
