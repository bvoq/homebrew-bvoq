class Psisolver < Formula
  desc "PSI Solver - Exact Inference for Probabilistic Programs"
  homepage "https://psisolver.org"
  version "1.0"
  url "https://github.com/eth-sri/psi.git",
      tag: 
      revision: "1e9f1b2c27bf8071188f3449e29121e43d25ca25"
  license "BSL-1.0"
  head "https://github.com/eth-sri/psi.git", branch: "master"

  depends_on "gnuplot" => :optional

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
