class Teamsctl < Formula
  desc "Microsoft Teams CLI and MCP server"
  homepage "https://github.com/TheSinding/teamsctl"
  url "https://github.com/TheSinding/teamsctl/archive/refs/tags/0.4.tar.gz"
  sha256 "52ff54aea7f5bc185393ee825774f5cb5b7042c0cbd6bf4a02e345a6620daf0d"
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
