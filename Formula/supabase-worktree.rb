class SupabaseWorktree < Formula
  desc "Isolated Supabase stack per project or git worktree"
  homepage "https://github.com/yannikw23/supabase-worktree"
  url "https://github.com/yannikw23/supabase-worktree/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "7ee86643037ee1b1215f8813cd421088826fdbd713ddfac17a4b48d1c2ef96cc"
  license "MIT"
  version "0.1.0"

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
    assert_match "supabase-worktree 0.1.0", shell_output("#{bin}/supabase-worktree version")
    assert_match "Usage:", shell_output("#{bin}/supabase-worktree help")
  end
end
