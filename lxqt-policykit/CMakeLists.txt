cmake_minimum_required(VERSION 3.0.2 FATAL_ERROR)

project(lxqt-policykit)

option(WITH_LXQT_POLICYKIT_AGENT "Build lxqt-policykit-agent translations" ON)

#components
add_component(WITH_LXQT_POLICYKIT_AGENT lxqt-policykit-agent)
