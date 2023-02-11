class ScalaWorks < Formula
  desc "command line utility to help with scala-works resources"
  homepage "https://github.com/scala-works/scala-works-cli"
  url "https://github.com/scala-works/scala-works-cli/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "8cd2dddb0d2f36397ec99b83c5922df5acbbf7c2e593ef379660556520fb283a"
  license "Apache 2"

  depends_on "Virtuslab/scala-cli/scala-cli" => :build

  def install
    system "scala-cli", "package", ".", "-o", "sw"
    bin.install "./sw"
  end

  test do
    system bin/"sw"
  end
end
