require 'formula'

class Simspark < Formula
  homepage ''
  url 'http://downloads.sourceforge.net/project/simspark/simspark/0.2.4/simspark-0.2.4.tar.gz'
  sha1 'f1cee938564c5d8de01a38bab8340d78585ccb89'

  depends_on 'cmake' => :build
  depends_on 'boost'
  depends_on 'sdl'
  depends_on 'devil'
  depends_on 'ode'

  def patches
    DATA
  end

  def install
    system "cmake . #{std_cmake_parameters} -DUSE_COREFOUNDATION=OFF -DPDFLATEX_COMPILER=OFF" # don't make manual.tex
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
