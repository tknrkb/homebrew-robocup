require 'formula'

class Rcssserver < Formula
  homepage ''
  url 'http://downloads.sourceforge.net/project/sserver/rcssserver/15.2.2/rcssserver-15.2.2.tar.gz'
  sha1 '43012eb5301716e457e93ec42c0c00727e600c84'

  depends_on 'boost' => :build
  depends_on 'rcssmonitor'
  depends_on 'rcsslogplayer'

  def install
    ENV.j1  # if your formula's build system can't parallelize

    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test rcssserver`.
    system "false"
  end
end
