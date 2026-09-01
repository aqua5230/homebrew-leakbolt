class Leakbolt < Formula
  desc "在 git commit 前自動攔截並防範 API 金鑰與密鑰外洩"
  homepage "https://github.com/aqua5230/leakbolt"
  url "https://github.com/aqua5230/leakbolt/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "5dab3d67f1f3ce2b15b9f0e525492ebf5ce18e8290be8c15c2de81372dddaac0"
  license "MIT"

  depends_on "go" => :build
  depends_on "gitleaks"

  def install
    cd "prototype" do
      system "go", "build", *std_go_args(ldflags: "-s -w"), "."
    end
  end

  test do
    assert_match "leakbolt", shell_output("#{bin}/leakbolt --version")
  end
end
