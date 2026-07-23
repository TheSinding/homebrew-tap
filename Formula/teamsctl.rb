class Teamsctl < Formula
  desc "Microsoft Teams CLI and MCP server"
  homepage "https://github.com/TheSinding/teamsctl"
  url "https://github.com/TheSinding/teamsctl/archive/refs/tags/0.3.tar.gz"
  sha256 "2e5a31f4f8e3db5fe148c4bf1ef9deb82fb82e2eca5455fa0f881eac8d3ca9f9"
  license "Unlicense"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X thesinding/teamsctl/internal/version.Value=#{version}"
    system "go", "build", *std_go_args(ldflags:), "./cmd/teamsctl"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/teamsctl version").strip
  end
end
