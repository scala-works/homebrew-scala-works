class ScalaWorks < Formula
  desc "Command-line utility to help with scala-works resources"
  homepage "https://github.com/scala-works/scala-works-cli"
  url "https://github.com/scala-works/scala-works-cli/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "e31a4fa436cf1d13a057bef22e19dc657a6d9a3f2f79bcc0e84f6b5ec82abc65"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/scala-works/homebrew-scala-works/releases/download/scala-works-0.0.2"
    sha256 cellar: :any_skip_relocation, monterey:     "486cb3974c142c7971783212b1c1a41c3899dd19cbe721006874544b7dfa4e4c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "753e0b893a40b0fb225d476148557a44f0dcb8a3f3ee338c508eb08ceafdf10a"
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
