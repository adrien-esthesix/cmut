
set(CMUT__TARGET__GENERATE_VERSION_SOURCE__SCRIPT "${CMAKE_CURRENT_LIST_DIR}/generate_version_source.cmake")


function(cmut__target__generate_version_source__collect_variable_to_forward result version_cpp_in)

    file( READ "${version_cpp_in}" lines )
    string( REGEX MATCHALL "@[A-Za-z0-9_]+@" matchs ${lines} )
    list( REMOVE_DUPLICATES matchs )

    foreach(element IN LISTS matchs)
        string( REGEX MATCH "[A-Za-z0-9_]+" variable ${element} )
        list(APPEND variables ${variable})
    endforeach()

    set(${result} "${variables}" PARENT_SCOPE)

endfunction()

macro(cmut__cache__add output_string variable value type)

    string(APPEND ${output_string} "set( ${variable} \"${value}\" CACHE ${type} \"\")\n" )

endmacro()

macro(cmut__cache__add_internal output_string variable value)

    cmut__cache__add( ${output_string} ${variable} ${value} INTERNAL )

endmacro()


function(cmut__target__generate_version_source target version_cpp_in)

    set(version_cpp_out "${CMAKE_CURRENT_BINARY_DIR}/version.cpp")
    if(NOT IS_ABSOLUTE "${version_cpp_in}")
        set(version_cpp_in "${CMAKE_CURRENT_SOURCE_DIR}/${version_cpp_in}")
    endif()

    set( cache_string )
    cmut__cache__add_internal( cache_string CMUT__TARGET__GENERATE_VERSION_SOURCE__INPUT "${version_cpp_in}")
    cmut__cache__add_internal( cache_string CMUT__TARGET__GENERATE_VERSION_SOURCE__OUTPUT "${version_cpp_out}")

    cmut__target__generate_version_source__collect_variable_to_forward( variables "${version_cpp_in}")
    foreach( variable IN LISTS variables )
        cmut__cache__add_internal( cache_string ${variable} "${${variable}}")
    endforeach()


    set(version_cpp_cache "${CMAKE_CURRENT_BINARY_DIR}/version.cpp.cache.cmake")
    file(WRITE "${version_cpp_cache}" "# file generated by cmut__target__generate_version_source.\n\n" "${cache_string}")



    add_custom_command( OUTPUT "${version_cpp_out}"
        COMMAND ${CMAKE_COMMAND} -C ${version_cpp_cache} -P "${CMUT__TARGET__GENERATE_VERSION_SOURCE__SCRIPT}"
        COMMENT "generate ${target}'s version.cpp file"
        )

    target_sources( ${target} PRIVATE
        "${version_cpp_out}"
        )

    set_source_files_properties( ${version_cpp_out} PROPERTIES GENERATED ON )
    set_source_files_properties( ${version_cpp_out} PROPERTIES SKIP_AUTOMOC ON )

endfunction()
