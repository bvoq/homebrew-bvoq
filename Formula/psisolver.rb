class Psisolver < Formula
  desc "PSI Solver - Exact Inference for Probabilistic Programs"
  homepage "https://psisolver.org"
  url "https://github.com/eth-sri/psi.git",
      tag:      "pldi20",
      revision: "4e213f13056362fbd92e9e64797ccba1b523eb9c"
  license "BSL-1.0"
  head "https://github.com/eth-sri/psi.git", branch: "master"

  on_macos do
    depends_on "ldc" => :build
    depends_on "gnuplot" => :build
  end

  on_linux do
    depends_on "dmd" => :build
    depends_on "gnuplot" => :build
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
