class Doitlive < Formula
  include Language::Python::Virtualenv

  desc "Replay stored shell commands for live presentations"
  homepage "https://doitlive.readthedocs.io/en/latest/"
  url "https://files.pythonhosted.org/packages/02/5a/ec8769dc1c6f81939c0f7839b885f27b62b79b67fe69fcc67f347c0dd3ff/doitlive-4.4.0.tar.gz"
  sha256 "1b0031d6ce97778a292b247ccb762fda8212c1b935bc7da6a2be92f677a4ea60"
  license "MIT"
  head "https://github.com/sloria/doitlive.git", branch: "dev"

  bottle do
    rebuild 3
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "505088d27336c3714fb17b79070b66d4843d16f682e39aa0677d4a705f8a50a6"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "a800f32a719d95efda63bac79677116e18efbed25d3eaaea7d133d90081ee5d3"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "bf04763aa01e55be03b86124e7643b5162d705303fc50f77f4a6024ef841050d"
    sha256 cellar: :any_skip_relocation, sonoma:         "e32cab3a03376a72ec478066f7f5136e4f2833eb3b764e8faf3edc8e6055ca5a"
    sha256 cellar: :any_skip_relocation, ventura:        "efd16f651a4b078715883f01f3ccadcefd4c3e2295d069305dc2f997eb683cb5"
    sha256 cellar: :any_skip_relocation, monterey:       "a67dc9f0f565904c49df05833474180c242d22f0adce238a1cf6e2d1f30ee944"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "d9343a180f4d18746ca9fd984770c93b0ca5e6b13250b389ecfe91942872b84e"
  end

  depends_on "python-packaging"
  depends_on "python@3.12"
  depends_on "six"

  resource "click" do
    url "https://files.pythonhosted.org/packages/27/6f/be940c8b1f1d69daceeb0032fee6c34d7bd70e3e649ccac0951500b4720e/click-7.1.2.tar.gz"
    sha256 "d2b5255c7c6349bc1bd1e59e08cd12acbbd63ce649f2588755783aa94dfb6b1a"
  end

  resource "click-completion" do
    url "https://files.pythonhosted.org/packages/93/18/74e2542defdda23b021b12b835b7abbd0fc55896aa8d77af280ad65aa406/click-completion-0.5.2.tar.gz"
    sha256 "5bf816b81367e638a190b6e91b50779007d14301b3f9f3145d68e3cade7bce86"
  end

  resource "click-didyoumean" do
    url "https://files.pythonhosted.org/packages/2f/a7/822fbc659be70dcb75a91fb91fec718b653326697d0e9907f4f90114b34f/click-didyoumean-0.3.0.tar.gz"
    sha256 "f184f0d851d96b6d29297354ed981b7dd71df7ff500d82fa6d11f0856bee8035"
  end

  resource "jinja2" do
    url "https://files.pythonhosted.org/packages/7a/ff/75c28576a1d900e87eb6335b063fab47a8ef3c8b4d88524c4bf78f670cce/Jinja2-3.1.2.tar.gz"
    sha256 "31351a702a408a9e7595a8fc6150fc3f43bb6bf7e319770cbc0db9df9437e852"
  end

  resource "markupsafe" do
    url "https://files.pythonhosted.org/packages/6d/7c/59a3248f411813f8ccba92a55feaac4bf360d29e2ff05ee7d8e1ef2d7dbf/MarkupSafe-2.1.3.tar.gz"
    sha256 "af598ed32d6ae86f1b747b82783958b1a4ab8f617b06fe68795c7f026abbdcad"
  end

  resource "shellingham" do
    url "https://files.pythonhosted.org/packages/74/31/6d2297b76389dd1b542962063675eb19bb9225421f278d9241da0c672739/shellingham-1.5.3.tar.gz"
    sha256 "cb4a6fec583535bc6da17b647dd2330cf7ef30239e05d547d99ae3705fd0f7f8"
  end

  def install
    virtualenv_install_with_resources

    generate_completions_from_executable(bin/"doitlive", "completion", shell_parameter_format: :none)
  end

  test do
    system bin/"doitlive", "themes", "--preview"
  end
end
