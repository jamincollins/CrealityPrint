if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
set(_conf_cmd ./configure)
set(_make_cmd make -j${NPROC})
set(_install_cmd make -j${NPROC} install)
ExternalProject_Add(dep_FFmpeg
    #EXCLUDE_FROM_ALL ON
    URL "https://ffmpeg.org/releases/ffmpeg-4.4.5.tar.bz2"
    URL_HASH SHA256=501c299145c3e86c74ea73046286eb8313d0d36b6b405c03cf26455799a47910
    DOWNLOAD_DIR ${DEP_DOWNLOAD_DIR}/FFmpeg
	CONFIGURE_COMMAND ${_conf_cmd}
        "--prefix=${DESTDIR}"
        "--enable-gpl"
        "--enable-libx264"
        "--enable-static"
        "--disable-x86asm"
    BUILD_IN_SOURCE ON
    BUILD_COMMAND ${_make_cmd}
    INSTALL_COMMAND ${_install_cmd}
)
endif()
