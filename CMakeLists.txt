cmake_minimum_required(VERSION 3.0.2 FATAL_ERROR)

project(translations)

find_package(lxqt REQUIRED)
include(LXQtTranslate)
include(GNUInstallDirs)

option(WITH_COMPTON_CONF "Build compton-conf translations" ON)
option(WITH_LIBFM_QT "Build libfm-qt translations" ON)
option(WITH_LIBLXQT "Build liblxqt translations" ON)
option(WITH_LXIMAGE_QT "Build lximage-qt translations" ON)
option(WITH_LXQT_ABOUT "Build lxqt-about translations" ON)
option(WITH_LXQT_ADMIN "Build lxqt-admin translations" ON)
option(WITH_LXQT_CONFIG "Build lxqt-config translations" ON)
option(WITH_LXQT_GLOBALKEYS "Build lxqt-globalkeys translations" ON)

option(WITH_LXQT_OPENSSH_ASKPASS "Build lxqt-openssh-askpass translations" ON)
option(WITH_LXQT_PANEL "Build lxqt-panel translations" ON)
option(WITH_LXQT_RUNNER "Build lxqt-runner translations" ON)
option(WITH_LXQT_SUDO "Build lxqt-sudo translations" ON)
option(WITH_OBCONF_QT "Build obconf-qt translations" ON)
option(WITH_PCMANFM_QT "Build pcmanfm-qt translations" ON)
option(WITH_QTERMINAL "Build qterminal translations" ON)

macro(add_component VAR_OPTION VAR_SUBDIR)
    if (${VAR_OPTION})
        add_subdirectory("${VAR_SUBDIR}")
        add_custom_target("install-${VAR_SUBDIR}"
            "${CMAKE_COMMAND}"
            -D "CMAKE_INSTALL_COMPONENT='${VAR_SUBDIR}'"
            -P "'${CMAKE_CURRENT_BINARY_DIR}/${VAR_SUBDIR}'/cmake_install.cmake"
        )
    endif ()
endmacro()

macro(build_component VAR_TRANS_DIR VAR_INSTALL_DIR)
    if ("${VAR_INSTALL_DIR}" STREQUAL "")
        set(QM_INSTALL_DIR "${LXQT_TRANSLATIONS_DIR}/${PROJECT_NAME}")
    else ()
        set(QM_INSTALL_DIR "${VAR_INSTALL_DIR}")
    endif ()

    message(STATUS "Will make translations from ${PROJECT_NAME}, install path ${QM_INSTALL_DIR}")
    lxqt_translate_ts(QM_FILES
        TRANSLATION_DIR "${VAR_TRANS_DIR}"
        INSTALL_DIR "${QM_INSTALL_DIR}"
        COMPONENT "${PROJECT_NAME}"
    )

    add_custom_target("${PROJECT_NAME}_ts" ALL DEPENDS ${QM_FILES})
endmacro()

macro(build_sub_component VAR_OPTION VAR_SUBDIR VAR_TEMPLATE)
    if (${VAR_OPTION})
        set(QM_INSTALL_DIR "${LXQT_TRANSLATIONS_DIR}/${PROJECT_NAME}/${VAR_TEMPLATE}")
        message(STATUS "Will make translations from ${PROJECT_NAME}/${VAR_SUBDIR}, install path ${QM_INSTALL_DIR}")
        lxqt_translate_ts(QM_FILES
            TRANSLATION_DIR "${VAR_SUBDIR}"
            TEMPLATE "${VAR_TEMPLATE}"
            INSTALL_DIR "${QM_INSTALL_DIR}"
            COMPONENT "${PROJECT_NAME}"
        )
        add_custom_target("${PROJECT_NAME}_${VAR_SUBDIR}_ts" ALL DEPENDS ${QM_FILES})
    endif ()
endmacro()


add_component(WITH_COMPTON_CONF compton-conf)
add_component(WITH_LIBFM_QT libfm-qt)
add_component(WITH_LIBLXQT liblxqt)
add_component(WITH_LXIMAGE_QT lximage-qt)
add_component(WITH_LXQT_ABOUT lxqt-about)
add_component(WITH_LXQT_ADMIN lxqt-admin)
add_component(WITH_LXQT_CONFIG lxqt-config)
add_component(WITH_LXQT_GLOBALKEYS lxqt-globalkeys)

add_component(WITH_LXQT_OPENSSH_ASKPASS lxqt-openssh-askpass)
add_component(WITH_LXQT_PANEL lxqt-panel)
add_component(WITH_LXQT_RUNNER lxqt-runner)
add_component(WITH_LXQT_SUDO lxqt-sudo)
add_component(WITH_OBCONF_QT obconf-qt)
add_component(WITH_PCMANFM_QT pcmanfm-qt)
add_component(WITH_QTERMINAL qterminal)
