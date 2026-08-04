class Teamsctl < Formula
  desc "Microsoft Teams CLI and MCP server"
  homepage "https://github.com/TheSinding/teamsctl"
  url "https://github.com/TheSinding/teamsctl/archive/refs/tags/0.6.tar.gz"
  sha256 "3301952c779629c17b76ed32e42eaa61ca3e926da6871cf64c895be9b389d5c6"
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
