require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Simspark < Formula
  homepage ''
  url 'http://downloads.sourceforge.net/project/simspark/simspark/0.2.2/simspark-0.2.2.tar.gz'
  md5 'b93320a0c6794766cab6bd37b6081d12'

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
    system "cmake . #{std_cmake_parameters}"
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
*** a/lib/salt/gmath.h	2012-05-12 23:38:09.000000000 +0900
--- b/lib/salt/gmath.h	2012-05-12 23:39:07.000000000 +0900
***************
*** 28,33 ****
--- 28,34 ----
  
  #include "defines.h"
  #include <cmath>
+ #include <boost/math/special_functions/fpclassify.hpp>
  
  #ifdef WIN32
  #include <float.h>
***************
*** 226,232 ****
      assert(std::numeric_limits<TYPE>::has_infinity);
      return (std::numeric_limits<double>::infinity() != f);
  #else
!     return isfinite(f);
  #endif
  }
  
--- 227,233 ----
      assert(std::numeric_limits<TYPE>::has_infinity);
      return (std::numeric_limits<double>::infinity() != f);
  #else
!     return boost::math::isfinite(f);
  #endif
  }
  
