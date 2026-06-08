# typed: false
# frozen_string_literal: true

class Tailfeed < Formula
  desc "A tail-style RSS reader with browser and terminal interfaces"
  homepage "https://github.com/kumagaias/tailfeed"
  version "0.1.39"
  license "MIT"

  machine = `uname -m`.strip

  if OS.mac? && (Hardware::CPU.intel? || machine == "x86_64")
    url "https://github.com/kumagaias/tailfeed/releases/download/v0.1.39/tailfeed_darwin_amd64.tar.gz"
    sha256 "d17c140f2a09483e86a6151eb2d6cc159c4a440c70b000da1781476470864418"
  elsif OS.mac? && (Hardware::CPU.arm? || machine == "arm64" || machine == "aarch64")
    url "https://github.com/kumagaias/tailfeed/releases/download/v0.1.39/tailfeed_darwin_arm64.tar.gz"
    sha256 "6eb25fa970a6b38f12a69b04584d0c24a3f375871099e719453feecd52eaa2c4"
  elsif OS.linux? && (Hardware::CPU.intel? || machine == "x86_64") && Hardware::CPU.is_64_bit?
    url "https://github.com/kumagaias/tailfeed/releases/download/v0.1.39/tailfeed_linux_amd64.tar.gz"
    sha256 "122f15cf7ac05ab70755926fb76bb60b4d02055e0c8ba17909cd6d5516471e5e"
  elsif OS.linux? && (Hardware::CPU.arm? || machine == "arm64" || machine == "aarch64") && Hardware::CPU.is_64_bit?
    url "https://github.com/kumagaias/tailfeed/releases/download/v0.1.39/tailfeed_linux_arm64.tar.gz"
    sha256 "7487e5311afcea26033f914e7766da6805da3b157b429416815fe730b3aab69e"
  end

  def install
    bin.install "tailfeed"
  end

  def caveats
    <<~EOS
      Get started by adding sample feeds (Hacker News, GitHub Blog, and more):
        tailfeed add sample

      Then open the browser UI:
        tailfeed

      Or open the terminal UI:
        tailfeed -t
    EOS
  end

  test do
    system "#{bin}/tailfeed", "--version"
  end
end
