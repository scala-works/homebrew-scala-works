class ScalaWorks < Formula
  desc "Command-line utility to help with scala-works resources"
  homepage "https://github.com/scala-works/scala-works-cli"
  url "https://github.com/scala-works/scala-works-cli/releases/download/v0.0.1/scala-works-cli-v0.0.1-ubuntu-latest.tar.gz"
  sha256 "cf4c946018eec75a5d39ea0bd9e2658120d76e59424879bea1c179c2d2a3136e"
  license "Apache-2.0"

  def install
    bin.install "scala-works-cli" => "sw"
  end

  def caveats
    <<~EOS
      This application is packages with scala-cli. It will pick up JAVA_HOME
      which needs to be at least 11.
    EOS
  end

  test do
    system bin/"sw"
  end
end
