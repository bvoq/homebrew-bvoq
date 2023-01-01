class Psisolver < Formula
  desc "PSI Solver - Exact Inference for Probabilistic Programs"
  homepage "https://psisolver.org"
  url "https://github.com/eth-sri/psi.git",
      tag:      "pldi20",
      revision: "4e213f13056362fbd92e9e64797ccba1b523eb9c"
  license "BSL-1.0"
  head "https://github.com/eth-sri/psi.git", branch: "v0.x.x"

  bottle do
    #sha256 cellar: :any_skip_relocation, arm64_ventura:  "7e6252836306569a5db84f97a76e4c5b90eeafff951409a042081838595d4327"
    #sha256 cellar: :any_skip_relocation, arm64_monterey: "2aeb82c327f80c2308b8dfa2572a746853a04bc39b0d04afda767eb01c2a83e7"
    #sha256 cellar: :any_skip_relocation, arm64_big_sur:  "366d877bb066339d120387fea51f5145354c3c43a8d0c65b43b887722c59f7eb"
    #sha256 cellar: :any_skip_relocation, monterey:       "b6f7197f2f1580bff0f06ed086ca679c310d87d64ed506ce8deb89fd49a7d514"
    #sha256 cellar: :any_skip_relocation, big_sur:        "e558a7feb8739e2064851d66769050b26b8bab8bf009356a773cda5a39e924e4"
    #sha256 cellar: :any_skip_relocation, catalina:       "3b322f9dbfb2062678b18e6e53719204446315e2fc70a788759505cdc663b839"
    #sha256 cellar: :any_skip_relocation, x86_64_linux:   "852cdd41ee99f72be5b7e22af09e07a5da3457791016a78ec0038f3172c96120"
  end

  on_macos do
    depends_on "ldc" => :build
  end

  on_linux do
    depends_on "dmd" => :build
  end

  def install
    system "bash", "build-release.sh"
    bin.install "psi" => "psisolver"
  end

  test do
    (testpath/"test.psi").write <<~EOS
      def main(){
        a := gauss(100,15);
        b := gauss(100,15);
        c := a > b;
        return c;
      }
    EOS

    assert_equal "p(c) = 1/2·δ(0)[c]+1/2·δ(1)[c]", shell_output("#{bin}/psisolver test.psi").strip
  end
end
