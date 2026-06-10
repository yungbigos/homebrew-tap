class SupabaseWorktree < Formula
  desc "Isolated Supabase stack per project or git worktree"
  homepage "https://github.com/yungbigos/supabase-worktree"
  url "https://github.com/yungbigos/supabase-worktree/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "ef2d01f8d871b0048f039d895199cb12e26805f61ad3ca562c198067bf14a6bc"
  license "MIT"

  # `supabase` is intentionally not a depends_on: it ships from both
  # homebrew/core and supabase/tap, and depending on either conflicts with
  # users who installed it via the other tap. Users must install supabase
  # themselves (either tap works).
  depends_on "libpq" # provides psql and pg_restore

  def install
    bin.install "bin/supabase-worktree"
    zsh_completion.install  "completions/_supabase-worktree"
    bash_completion.install "completions/supabase-worktree.bash"
  end

  test do
    assert_match "supabase-worktree 0.5.0", shell_output("#{bin}/supabase-worktree version")
    assert_match "Usage:", shell_output("#{bin}/supabase-worktree help")
  end
end
