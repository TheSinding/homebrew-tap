class Teamsctl < Formula
  desc "Microsoft Teams CLI and MCP server"
  homepage "https://github.com/TheSinding/teamsctl"
  url "https://github.com/TheSinding/teamsctl/archive/refs/tags/0.6.tar.gz"
  sha256 "e2b4d3246923e22c0c6ae23f0a7b5036e37b710a066d0932d0410fef9713b06a"
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
