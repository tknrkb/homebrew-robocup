require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Rcssserver3d < Formula
  homepage ''
  url 'http://downloads.sourceforge.net/project/simspark/rcssserver3d/0.6.7/rcssserver3d-0.6.7.tar.gz'
  sha1 '5ce75d95ebdc19aaf6ecfd5f7d8cb9e48435de03'

  depends_on 'cmake' => :build
  depends_on 'boost'
  depends_on 'simspark'

  def patches
    DATA
  end

  def install
    # ENV.x11 # if your formula requires any X11 headers
    # ENV.j1  # if your formula's build system can't parallelize

    #system "./configure", "--disable-debug", "--disable-dependency-tracking",
    #                      "--prefix=#{prefix}"
    system "cmake . #{std_cmake_parameters} -DUSE_COREFOUNDATION=OFF -DPDFLATEX_COMPILER=OFF"
    system "make VERBOSE=1 install" # if this fails, try separate make/make install steps
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test rcssserver3d`.
    system "false"
  end
end

__END__
*** a/plugin/soccer/CMakeLists.txt	2013-06-29 17:54:16.000000000 +0200
--- b/plugin/soccer/CMakeLists.txt	2013-06-29 17:55:14.000000000 +0200
***************
*** 136,142 ****
  
  add_library(soccer MODULE ${soccer_LIB_SRCS} ${soccer_LIB_HDRS})
  
! target_link_libraries(soccer ${spark_libs} ${OPENGL_gl_LIBRARY})
  
  if (NOT APPLE)
     set_target_properties(soccer PROPERTIES VERSION 1.1.0 SOVERSION 1)
--- 136,142 ----
  
  add_library(soccer MODULE ${soccer_LIB_SRCS} ${soccer_LIB_HDRS})
  
! target_link_libraries(soccer ${spark_libs} ${OPENGL_gl_LIBRARY} ${Boost_LIBRARIES})
  
  if (NOT APPLE)
     set_target_properties(soccer PROPERTIES VERSION 1.1.0 SOVERSION 1)
*** a/plugin/soccermonitor/CMakeLists.txt	2013-06-29 17:56:54.000000000 +0200
--- b/plugin/soccermonitor/CMakeLists.txt	2013-06-29 17:57:31.000000000 +0200
***************
*** 24,30 ****
  add_library(soccermonitor MODULE ${soccermonitor_LIB_SRCS}
     ${soccermonitor_LIB_HDRS})
  
! target_link_libraries(soccermonitor ${spark_libs} ${OPENGL_LIBRARIES})
  
  if (NOT APPLE)
     set_target_properties(soccermonitor PROPERTIES VERSION 1.0.0 SOVERSION 1)
--- 24,30 ----
  add_library(soccermonitor MODULE ${soccermonitor_LIB_SRCS}
     ${soccermonitor_LIB_HDRS})
  
! target_link_libraries(soccermonitor ${spark_libs} ${OPENGL_LIBRARIES} ${Boost_LIBRARIES})
  
  if (NOT APPLE)
     set_target_properties(soccermonitor PROPERTIES VERSION 1.0.0 SOVERSION 1)
