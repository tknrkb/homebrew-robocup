require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Simspark < Formula
  homepage ''
  url 'http://downloads.sourceforge.net/project/simspark/simspark/0.2.3/simspark-0.2.3.tar.gz'
  md5 'b653af47b014b0af99d5dda1e3949d7b'

  depends_on 'cmake' => :build
  #find_package(Ruby REQUIRED)
  #find_package(Freetype REQUIRED)
  #find_package(DevIL REQUIRED)
  depends_on 'devil'
  #find_package(Boost REQUIRED thread COMPONENTS regex date_time)
  depends_on 'boost'
  #find_package(wxWidgets COMPONENTS gl base core)
  #depends_on 'wxmac'
  #find_package(ODE REQUIRED)
  depends_on 'ode'
  #find_package(OpenGL REQUIRED)
  #find_package(SDL REQUIRED)
  depends_on 'sdl'
  #find_package(FMOD)
  #find_package(ZLIB)

  def patches
    DATA
  end

  def install
    # ENV.x11 # if your formula requires any X11 headers
    # ENV.j1  # if your formula's build system can't parallelize

    #system "./configure", "--disable-debug", "--disable-dependency-tracking",
    #                      "--prefix=#{prefix}"
    system "cmake . #{std_cmake_parameters} -DUSE_COREFOUNDATION=OFF"
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test simspark`.
    system "false"
  end
end

__END__
*** a/lib/salt/gmath.h	2012-05-23 21:44:40.000000000 +0900
--- b/lib/salt/gmath.h	2012-05-23 21:51:22.000000000 +0900
***************
*** 29,34 ****
--- 29,38 ----
  #include "defines.h"
  #include <cmath>
  
+ #ifdef __APPLE__
+ #include <boost/math/special_functions/fpclassify.hpp>
+ #endif
+ 
  #ifdef WIN32
  #include <float.h>
  #include <limits>
***************
*** 225,230 ****
--- 229,236 ----
      // isfinite is part of C99 but not available in Visual C++
      assert(std::numeric_limits<TYPE>::has_infinity);
      return (std::numeric_limits<double>::infinity() != f);
+ #elif __APPLE__
+     return boost::math::isfinite(f);
  #else
      return std::isfinite(f);
  #endif
