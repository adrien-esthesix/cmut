

function(cmut__config__default_build_type default_build_type)

    if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)

        if( CONAN_EXPORTED )
            cmut_info("[cmut][config][default_build_type]: Setting build type to '${default_build_type}' skipped as CONAN_EXPORTED is defined.")
            return()
        endif()

        cmut_info("[cmut][config][default_build_type]: Setting build type to '${default_build_type}' as no one is specified.")
        set(CMAKE_BUILD_TYPE "${default_build_type}" CACHE STRING "Choose the type of build." FORCE)

        # Set the possible values of build type for cmake-gui
        set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release" "MinSizeRel" "RelWithDebInfo")

    endif()

endfunction()
