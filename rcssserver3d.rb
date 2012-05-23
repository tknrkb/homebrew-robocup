require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Rcssserver3d < Formula
  homepage ''
  url 'http://downloads.sourceforge.net/project/simspark/rcssserver3d/0.6.6/rcssserver3d-0.6.6.tar.gz'
  md5 '4d560e409700a869a8477b705cbb14c1'

  depends_on 'simspark'

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
    # were more thorough. Run the test with `brew test rcssserver3d`.
    system "false"
  end
end
