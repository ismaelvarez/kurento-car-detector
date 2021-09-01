# - Try to find KMSCARDETECTOR library

#=============================================================================
# Copyright 2014 Kurento
#
#=============================================================================

set(PACKAGE_VERSION "0.0.1~0.g40e9b69")
set(KMSCARDETECTOR_VERSION ${PACKAGE_VERSION})

message (STATUS "Looking for KMSCARDETECTOR: 0.0.1~0.g40e9b69")

include (GenericFind)

generic_find (
  REQUIRED
  LIBNAME KMSCORE
  VERSION ^6.0.0
)

generic_find (
  REQUIRED
  LIBNAME KMSELEMENTS
  VERSION ^6.0.0
)

generic_find (
  REQUIRED
  LIBNAME KMSFILTERS
  VERSION ^6.0.0
)

set (REQUIRED_VARS
  KMSCARDETECTOR_VERSION
  KMSCARDETECTOR_INCLUDE_DIRS
  KMSCARDETECTOR_LIBRARY
  KMSCARDETECTOR_LIBRARIES
)

set (KMSCARDETECTOR_BINARY_DIR_PREFIX "build" CACHE PATH "Path prefix used to look for binary files")
set (KMSCARDETECTOR_SOURCE_DIR_PREFIX "" CACHE PATH "Path prefix used to look for source files")

set(KMSCARDETECTOR_INCLUDE_DIRS
  ${KMSCORE_INCLUDE_DIRS}
  ${KMSELEMENTS_INCLUDE_DIRS}
  ${KMSFILTERS_INCLUDE_DIRS}
)

if (NOT "CarDetector.hpp CarsDetected.hpp CarDetectorInternal.hpp" STREQUAL " ")
  if (TARGET kmscardetectorinterface)
    set (KMSCARDETECTOR_INTERFACE_INCLUDE_DIR "${KMSCARDETECTOR_BINARY_DIR_PREFIX}/src/server/interface/generated-cpp")
  else ()
    find_path(KMSCARDETECTOR_INTERFACE_INCLUDE_DIR
      NAMES
        CarDetector.hpp CarsDetected.hpp
        CarDetectorInternal.hpp
      PATH_SUFFIXES
        ${KMSCARDETECTOR_BINARY_DIR_PREFIX}/src/server/interface/generated-cpp
        kurento/modules/cardetector
    )
  endif ()

  list (APPEND KMSCARDETECTOR_INCLUDE_DIRS ${KMSCARDETECTOR_INTERFACE_INCLUDE_DIR})
  list (APPEND REQUIRED_VARS KMSCARDETECTOR_INTERFACE_INCLUDE_DIR)
endif ()

if (NOT "CarDetectorImplFactory.hpp" STREQUAL "")
  if (TARGET kmscardetectorimpl)
    set (KMSCARDETECTOR_IMPLEMENTATION_INTERNAL_INCLUDE_DIR "${KMSCARDETECTOR_BINARY_DIR_PREFIX}/src/server/implementation/generated-cpp")
  else ()
    find_path(KMSCARDETECTOR_IMPLEMENTATION_INTERNAL_INCLUDE_DIR
      NAMES
        CarDetectorImplFactory.hpp
      PATH_SUFFIXES
        ${KMSCARDETECTOR_BINARY_DIR_PREFIX}/src/server/implementation/generated-cpp
        kurento/modules/cardetector
    )
  endif ()

  list (APPEND KMSCARDETECTOR_INCLUDE_DIRS ${KMSCARDETECTOR_IMPLEMENTATION_INTERNAL_INCLUDE_DIR})
  list (APPEND REQUIRED_VARS KMSCARDETECTOR_IMPLEMENTATION_INTERNAL_INCLUDE_DIR)
endif ()

if (NOT "CarDetectorImpl.hpp CarDetectorOpenCVImpl.hpp" STREQUAL "")
  if (TARGET kmscardetectorimpl)
    set (KMSCARDETECTOR_IMPLEMENTATION_GENERATED_INCLUDE_DIR "${KMSCARDETECTOR_SOURCE_DIR_PREFIX}/src/server/implementation/objects")
  else ()
    find_path(KMSCARDETECTOR_IMPLEMENTATION_GENERATED_INCLUDE_DIR
      NAMES
        CarDetectorImpl.hpp CarDetectorOpenCVImpl.hpp
      PATH_SUFFIXES
        src/server/implementation/objects
        kurento/modules/cardetector
    )
  endif ()

  list (APPEND KMSCARDETECTOR_INCLUDE_DIRS ${KMSCARDETECTOR_IMPLEMENTATION_GENERATED_INCLUDE_DIR})
  list (APPEND REQUIRED_VARS KMSCARDETECTOR_IMPLEMENTATION_GENERATED_INCLUDE_DIR)
endif()

if (NOT "" STREQUAL "")
  if (TARGET kmscardetectorimpl)
    set (KMSCARDETECTOR_IMPLEMENTATION_EXTRA_INCLUDE_DIR "${KMSCARDETECTOR_SOURCE_DIR_PREFIX}/")
  else ()
    find_path(KMSCARDETECTOR_IMPLEMENTATION_EXTRA_INCLUDE_DIR
      NAMES
        
      PATH_SUFFIXES
        
        kurento/modules/cardetector
    )
  endif ()

  list (APPEND KMSCARDETECTOR_INCLUDE_DIRS ${KMSCARDETECTOR_IMPLEMENTATION_EXTRA_INCLUDE_DIR})
  list (APPEND REQUIRED_VARS KMSCARDETECTOR_IMPLEMENTATION_EXTRA_INCLUDE_DIR)
endif ()

if (NOT "" STREQUAL "")
  if (TARGET kmscardetectorinterface)
    set (KMSCARDETECTOR_INTERFACE_EXTRA_INCLUDE_DIR "${KMSCARDETECTOR_SOURCE_DIR_PREFIX}/")
  else ()
    find_path(KMSCARDETECTOR_INTERFACE_EXTRA_INCLUDE_DIR
      NAMES
        
      PATH_SUFFIXES
        
        kurento/modules/cardetector
    )
  endif()

  list (APPEND KMSCARDETECTOR_INCLUDE_DIRS ${KMSCARDETECTOR_INTERFACE_EXTRA_INCLUDE_DIR})
  list (APPEND REQUIRED_VARS KMSCARDETECTOR_INTERFACE_EXTRA_INCLUDE_DIR)
endif ()

if (TARGET kmscardetectorimpl)
  set (KMSCARDETECTOR_LIBRARY kmscardetectorimpl)
else ()
  find_library (KMSCARDETECTOR_LIBRARY
    NAMES
      kmscardetectorimpl
    PATH_SUFFIXES
      ${KMSCARDETECTOR_BINARY_DIR_PREFIX}/src/server
  )
endif()

set (REQUIRED_LIBS "")
foreach (LIB ${REQUIRED_LIBS})
  string(FIND ${LIB} " " POS)

  if (${POS} GREATER 0)
    string(REPLACE " " ";" REQUIRED_LIB_LIST ${LIB})
    include (CMakeParseArguments)
    cmake_parse_arguments("PARAM" "" "LIBNAME" "" ${REQUIRED_LIB_LIST})

    if (DEFINED PARAM_LIBNAME)
      generic_find (${REQUIRED_LIB_LIST} REQUIRED)
      set (LIB_NAME ${PARAM_LIBNAME})
    else()
      string (SUBSTRING ${LIB} 0 ${POS} LIB_NAME)
      string (SUBSTRING ${LIB} ${POS} -1 LIB_VERSION)
      string (STRIP ${LIB_NAME} LIB_NAME)
      string (STRIP ${LIB_VERSION} LIB_VERSION)
      generic_find (LIBNAME ${LIB_NAME} REQUIRED VERSION "${LIB_VERSION}")
    endif()
  else ()
    string (STRIP ${LIB} LIB_NAME)
    generic_find (LIBNAME ${LIB_NAME} REQUIRED)
  endif ()
  list (APPEND REQUIRED_LIBRARIES ${${LIB_NAME}_LIBRARIES})
  list (APPEND KMSCARDETECTOR_INCLUDE_DIRS ${${LIB_NAME}_INCLUDE_DIRS})

endforeach()

set(KMSCARDETECTOR_INCLUDE_DIRS
  ${KMSCARDETECTOR_INCLUDE_DIRS}
  CACHE INTERNAL "Include directories for KMSCARDETECTOR library" FORCE
)

set (KMSCARDETECTOR_LIBRARIES
  ${KMSCARDETECTOR_LIBRARY}
  ${KMSCORE_LIBRARIES}
  ${KMSELEMENTS_LIBRARIES}
  ${KMSFILTERS_LIBRARIES}
  ${REQUIRED_LIBRARIES}
  CACHE INTERNAL "Libraries for KMSCARDETECTOR" FORCE
)

include (FindPackageHandleStandardArgs)

find_package_handle_standard_args(KMSCARDETECTOR
  FOUND_VAR
    KMSCARDETECTOR_FOUND
  REQUIRED_VARS
    ${REQUIRED_VARS}
  VERSION_VAR
    KMSCARDETECTOR_VERSION
)

mark_as_advanced(
  KMSCARDETECTOR_FOUND
  KMSCARDETECTOR_VERSION
  KMSCARDETECTOR_INTERFACE_INCLUDE_DIR
  KMSCARDETECTOR_IMPLEMENTATION_INTERNAL_INCLUDE_DIR
  KMSCARDETECTOR_IMPLEMENTATION_GENERATED_INCLUDE_DIR
  KMSCARDETECTOR_IMPLEMENTATION_EXTRA_INCLUDE_DIR
  KMSCARDETECTOR_INTERFACE_EXTRA_INCLUDE_DIR
  KMSCARDETECTOR_INCLUDE_DIRS
  KMSCARDETECTOR_LIBRARY
  KMSCARDETECTOR_LIBRARIES
)
