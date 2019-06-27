include(${CMAKE_CURRENT_LIST_DIR}/utils/cmut__utils__header_guard.cmake)
cmut__utils__define_header_guard()


include("${CMAKE_CURRENT_LIST_DIR}/install/cmut__install__add_install_component_targets.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/install/cmut__install__component_dependency.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/install/cmut__install__define_variables.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/install/cmut__install__fixup_bundle_dylib.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/install/cmut__install__install_cmut__dependency_files.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/install/cmut__install__install_config_and_version.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/install/cmut__install__install_config_file.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/install/cmut__install__install_config_directory.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/install/cmut__install__install_dependencies.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/install/cmut__install__install_hunter_3rd_party.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/install/cmut__install__install_library.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/install/cmut__install__install_or_update.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/install/cmut__install__install_qml.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/install/cmut__install__install_system_library.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/install/cmut__install__install_target.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/install/cmut__install__install_unix_launcher.cmake")
