class Leakbolt < Formula
  desc "在 git commit 前自動攔截並防範 API 金鑰與密鑰外洩"
  homepage "https://github.com/aqua5230/leakbolt"
  url "https://github.com/aqua5230/leakbolt/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "f146dec6c099b3b3bedd3d26e7080b33ed5efd1f80cd20b8fdf1b269de469dcc"
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
