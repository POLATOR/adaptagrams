function(install_target)
    set(OPTIONVALUES )
    set(ONEVALUES "TARGET")
    set(MULTIVALUES "FILES")
    cmake_parse_arguments(INSTALL_TARGET "${OPTIONVALUES}" "${ONEVALUES}" "${MULTIVALUES}" ${ARGN})
    message("installing " ${INSTALL_TARGET_TARGET} "files " ${INSTALL_TARGET_FILES})
    if(ADAPTAGRAMS_INSTALL)
        get_property(files TARGET  ${INSTALL_TARGET_TARGET} PROPERTY PUBLIC_HEADER)
        

        install(
            TARGETS ${INSTALL_TARGET_TARGET} 
            EXPORT adaptagramsTargets      
            RUNTIME DESTINATION bin
            ARCHIVE DESTINATION lib
            PUBLIC_HEADER DESTINATION include/adaptagrams/${INSTALL_TARGET_TARGET}
        )

        export(
            EXPORT adaptagramsTargets
            FILE "${CMAKE_CURRENT_BINARY_DIR}/adaptagrams/adaptagramsTargets.cmake"
            NAMESPACE adaptagrams::
        )

        set(ConfigPackageLocation lib/adaptagrams/cmake)
        
        install(EXPORT adaptagramsTargets
            FILE
                adaptagramsTargets.cmake
            NAMESPACE
                adaptagrams::
            DESTINATION
                ${ConfigPackageLocation}
        )

        get_target_property(pdb_output_dir ${INSTALL_TARGET_TARGET} PDB_OUTPUT_DIRECTORY)
        get_target_property(pdb_name ${INSTALL_TARGET_TARGET} PDB_NAME)
        if(NOT ${PDB_NAME} STREQUAL "NOTFOUND")
            install(FILES ${pdb_output_dir}/${pdb_name}.pdb DESTINATION bin)
        endif()
    endif(ADAPTAGRAMS_INSTALL)
endfunction(install_target)