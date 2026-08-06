class Openhuman < Formula
  desc "OpenAI-compatible API that relays chat completions to a Teams DM"
  homepage "https://github.com/TheSinding/openhuman"
  url "https://github.com/TheSinding/openhuman/archive/refs/tags/0.1.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "Unlicense"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X openhuman/internal/version.Value=#{version}"
    system "go", "build", *std_go_args(ldflags:), "./cmd/openhuman"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/openhuman -version").strip
  end
end
