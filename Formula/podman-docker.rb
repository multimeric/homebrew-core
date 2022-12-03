class Podman < Formula
  desc "Emulate Docker CLI using podman"
  homepage "https://podman.io/"
  url "https://github.com/containers/podman/archive/v4.3.1.tar.gz"
  sha256 "455c29c4ee78cd6365e5d46e20dd31a5ce4e6e1752db6774253d76bd3ca78813"
  license all_of: ["Apache-2.0", "GPL-3.0-or-later"]
  head "https://github.com/containers/podman.git", branch: "main"

  depends_on "podman"

  def install
    system "make", "install.docker-full"
  end

  test do
    out = shell_output("#{bin}/docker version", 125)
    assert_match "Podman Engine", out
  end
end
