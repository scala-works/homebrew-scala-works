class ScalaWorks < Formula
  desc "Command-line utility to help with scala-works resources"
  homepage "https://github.com/scala-works/scala-works-cli"
  url "https://github.com/scala-works/scala-works-cli/releases/download/v0.0.2/scala-works-cli-v0.0.2-ubuntu-latest.tar.gz"
  sha256 "0187078b3613ceb5b62c94bc77d3b650d1b6608082ffdbeece02ca143a88b26c"
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
