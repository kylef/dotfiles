function p
  # Jump into a selected project from `~/Projects`
  find ~/Projects -type d -maxdepth 2 -depth 2 -print | cut -d '/' -f5,6 | fzf > $TMPDIR/fzfp.result
  cd ~/Projects/(cat $TMPDIR/fzfp.result)
end
