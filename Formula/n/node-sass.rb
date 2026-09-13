class NodeSass < Formula
  desc "JavaScript implementation of a Sass compiler"
  homepage "https://github.com/sass/dart-sass"
  url "https://registry.npmjs.org/sass/-/sass-1.104.1.tgz"
  sha256 "7a935a71c27e77910a61fe079641b034ac11aaf2b30071e338f9948d9fe871d7"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "96b1823735c880e4859333beb81239f70e71f06f5643ce2c090292b4528f6144"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:       "6e22fbe67e262bce74ee673fc305f5b000330af31c5d6cec95dd61ef7fac1a8f"
    sha256 cellar: :any_skip_relocation, arm64_sequoia:     "6e22fbe67e262bce74ee673fc305f5b000330af31c5d6cec95dd61ef7fac1a8f"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:      "6e22fbe67e262bce74ee673fc305f5b000330af31c5d6cec95dd61ef7fac1a8f"
    sha256 cellar: :any_skip_relocation, arm64_linux:       "15aae503f4119f211962110c7abdf3cf7291dda6db959e77450113e0dc5c07c8"
    sha256 cellar: :any_skip_relocation, x86_64_linux:      "c5bbb8b39f4084040fe150017333326429ae66b621754eb25a67149865137e86"
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    (testpath/"test.scss").write <<~SCSS
      div {
        img {
          border: 0px;
        }
      }
    SCSS

    assert_equal "div img{border:0px}",
    shell_output("#{bin}/sass --style=compressed test.scss").strip
  end
end
