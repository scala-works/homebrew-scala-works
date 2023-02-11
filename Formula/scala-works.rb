class ScalaWorks < Formula
  desc "Command-line utility to help with scala-works resources"
  homepage "https://github.com/scala-works/scala-works-cli"
  url "https://github.com/scala-works/scala-works-cli/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "8cd2dddb0d2f36397ec99b83c5922df5acbbf7c2e593ef379660556520fb283a"
  license "Apache-2.0"

  resource "scala-cli" do
    url "https://github.com/VirtusLab/scala-cli/releases/download/v0.1.20/scala-cli"
    sha256 "0c070177249524e26e6e13571c240b2d1bdfcc24027fa7d6d4d46ce70c306c24"
  end

  def install
    resource("scala-cli").stage { bin.install "scala-cli" }
    system "scala-cli", "package", ".", "-o", "sw"
    bin.install "sw"
  end

  test do
    system bin/"sw"
  end
end
