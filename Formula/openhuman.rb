class Openhuman < Formula
  desc "OpenAI-compatible API that relays chat completions to a Teams DM"
  homepage "https://github.com/TheSinding/openhuman"
  url "https://github.com/TheSinding/openhuman/archive/refs/tags/0.1.tar.gz"
  sha256 "d0aed21143195df0ffeda4f7a466e88bf2ced4f8a259ffd92cd9506412680f4b"
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
