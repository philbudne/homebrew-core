class Msmtp < Formula
  desc "SMTP client that can be used as an SMTP plugin for Mutt"
  homepage "https://marlam.de/msmtp/"
  url "https://marlam.de/msmtp/releases/msmtp-1.8.18.tar.xz"
  sha256 "14fc62af37ebdcc5ed19a245a05eb8376efe7016118f00c9c594bc999d5560a5"
  license "GPL-3.0-or-later"

  livecheck do
    url "https://marlam.de/msmtp/download/"
    regex(/href=.*?msmtp[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  bottle do
    sha256 arm64_big_sur: "ab15c648729695ee988e5b1442c1ed8e4260cb8fe94c0eca7ad2e7c84ffbe651"
    sha256 big_sur:       "bc3bbdeb0e3334f9a60a37a24ec28c22f33364a37b53e01ad0a0a625f3eccde5"
    sha256 catalina:      "de21416d9080c652d1579c71309daa54b41f7ba93414399aeac8f0c83cce8637"
    sha256 mojave:        "a9cafc6ae8a4e6c0fd8ebc7db4bb6e06f0d4a3a981daf37d1d3deae1c02105e5"
    sha256 x86_64_linux:  "577cbcb8bf6a7ee660b0d33d3cc6a0aaa1a785478af46bf9d59d242bf3b41bbc"
  end

  depends_on "pkg-config" => :build
  depends_on "gettext"
  depends_on "gnutls"
  depends_on "libidn2"

  def install
    system "./configure", *std_configure_args, "--disable-silent-rules", "--with-macosx-keyring"
    system "make", "install"
    (pkgshare/"scripts").install "scripts/msmtpq"
  end

  test do
    system bin/"msmtp", "--help"
  end
end
