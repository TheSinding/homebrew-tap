class Teamsctl < Formula
  desc "Microsoft Teams CLI and MCP server"
  homepage "https://github.com/TheSinding/teamsctl"
  url "https://github.com/TheSinding/teamsctl/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "e3ccb145ca289e732291f293265e7e67c5bbdd26ccd9ca8b41bf9da5e21f2006"
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
