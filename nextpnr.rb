class Nextpnr < Formula
  include Hardware
  desc "NextPnr"
  homepage "https://github.com/YosysHQ/nextpnr"
  url "https://github.com/BracketMaster/homebrew-rtl/releases/download/v1.0/nextpnr.tar.gz"
  sha256 "70259bc677328d84177fa9232d5cb9058a5c9177f360718b6a151fe85cc5aaa8"
  head "https://github.com/YosysHQ/nextpnr.git"

  depends_on "cmake" => :build
  depends_on "make" => :build
  depends_on "git" => :build
  depends_on "qt5"
  depends_on "python3"
  depends_on "boost"
  depends_on "boost-python3"
  depends_on "eigen"
  depends_on "prjtrellis"
  depends_on "icestorm"

  bottle do
    root_url "https://github.com/BracketMaster/homebrew-rtl/releases/download/v1.0"
    cellar :any
    sha256 "76e80a6759b41f993dad8921d974716752da05ca4a2d33ebb01a55221da51cd2" => :high_sierra
  end

  def install
    system "cmake",
           "-DARCH=all",
           "-DTRELLIS_INSTALL_PREFIX=#{Formula["prjtrellis"].prefix}",
           "-DICEBOX_ROOT=#{Formula["icestorm"].share}/icebox",
           "-DCMAKE_INSTALL_PREFIX=#{prefix}"
           "."

    system "make"

    system "make",
           "install"

          

  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test homebrew-rtl`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
