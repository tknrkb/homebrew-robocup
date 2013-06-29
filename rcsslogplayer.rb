require 'formula'

class Rcsslogplayer < Formula
  homepage ''
  url 'http://downloads.sourceforge.net/project/sserver/rcsslogplayer/15.1.0/rcsslogplayer-15.1.0.tar.gz'
  sha1 'f1a4140ca98a642e87ea8862c9dcfc6b335df008'

  depends_on 'boost' => :build
  depends_on 'pkg-config' => :build
  depends_on 'qt'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test rcsslogplayer`.
    system "false"
  end
end
