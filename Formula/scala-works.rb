class ScalaWorks < Formula
  desc "Command-line utility to help with scala-works resources"
  homepage "https://github.com/scala-works/scala-works-cli"
  url "https://github.com/scala-works/scala-works-cli/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "8cd2dddb0d2f36397ec99b83c5922df5acbbf7c2e593ef379660556520fb283a"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/scala-works/homebrew-scala-works/releases/download/scala-works-0.0.1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7053ff82e98df5a98aa19879ba6ff7d35a6e6fdba020a876c47582c26fd5153e"
  end

  depends_on "openjdk" => :build

  resource "scala-cli" do
    url "https://github.com/VirtusLab/scala-cli/releases/download/v0.1.20/scala-cli"
    sha256 "0c070177249524e26e6e13571c240b2d1bdfcc24027fa7d6d4d46ce70c306c24"
  end

  def install
    ENV["JAVA_HOME"] = Formula["openjdk"].opt_prefix
    resource("scala-cli").stage do
      chmod "+x", "scala-cli"
      buildpath.install "scala-cli"
    end
    system buildpath/"scala-cli", "package", ".", "-o", "sw", "--jvm", "11"
    bin.install "sw"
  end

  def caveats
    <<~EOS
      This application is packages with scala-cli. It will pick up JAVA_HOME
      which needs to be at least 11.
    EOS
  end

  test do
    ENV["JAVA_HOME"] = Formula["openjdk"].opt_prefix
    system bin/"sw"
  end
end
