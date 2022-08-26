option(ADAPTAGRAMS_INSTALL OFF)

include(InstallTarget)

if(ADAPTAGRAMS_INSTALL)
set(INCLUDE_INSTALL_DIR include/)
set(LIB_INSTALL_DIR lib/)
include(CMakePackageConfigHelpers)

configure_package_config_file(
${CMAKE_MODULE_PATH}/adaptagramsConfig.cmake.in 
${CMAKE_CURRENT_BINARY_DIR}/adaptagramsConfig.cmake
INSTALL_DESTINATION lib/adaptagrams/cmake
PATH_VARS INCLUDE_INSTALL_DIR
)
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/adaptagramsConfig.cmake
        DESTINATION ${LIB_INSTALL_DIR}/adaptagrams/cmake )
endif(ADAPTAGRAMS_INSTALL)