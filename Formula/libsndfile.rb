class Libsndfile < Formula
  desc "C library for files containing sampled sound"
  homepage "https://libsndfile.github.io/libsndfile/"
  url "https://github.com/libsndfile/libsndfile/releases/download/1.2.0/libsndfile-1.2.0.tar.xz"
  sha256 "0e30e7072f83dc84863e2e55f299175c7e04a5902ae79cfb99d4249ee8f6d60a"
  license "LGPL-2.1-or-later"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    rebuild 1
    sha256 cellar: :any,                 arm64_ventura:  "7cdb108767e5974753eaf68d0b709d309d46c4aa4dfe997ca9b7d88f7c8d4f87"
    sha256 cellar: :any,                 arm64_monterey: "6355d1153204ae329ffdd4573a5585acf3658ef37d25dc28583c6451d7b014e0"
    sha256 cellar: :any,                 arm64_big_sur:  "0f7cbb29a5fe0c69ce74965ed33ac66455b7e849954c102e58566d9101144491"
    sha256 cellar: :any,                 ventura:        "1db3fa5ec99cc7d615bf8e3345ad05442ee469915830999a603e82cfa81560b9"
    sha256 cellar: :any,                 monterey:       "39def1916e1e36ea8ed47dbcaf57bd858f57e5ac2153a3304a2785f666a25d64"
    sha256 cellar: :any,                 big_sur:        "90d04f9535380ce27d3bd064fceaaa246c6ecc5d31d0885a4dda1c8da6335ddf"
    sha256 cellar: :any,                 catalina:       "d0e19056bec6f6cf698996f4909d8e5bb61114498c51b36cf23a1d87414a6967"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "bc1b43c72b5fd140d1d4292918d2e3ba5e4d8b911e094473d6f3739d18a1b97f"
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "flac"
  depends_on "lame"
  depends_on "libogg"
  depends_on "libvorbis"
  depends_on "mpg123"
  depends_on "opus"

  uses_from_macos "python" => :build

  def install
    system "autoreconf", "-fvi"
    system "./configure", *std_configure_args
    system "make", "install"
  end

  test do
    output = shell_output("#{bin}/sndfile-info #{test_fixtures("test.wav")}")
    assert_match "Duration    : 00:00:00.064", output
  end
end
