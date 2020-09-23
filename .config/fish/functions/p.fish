function p
  # Jump into a selected project from `~/Projects`
  cd ~/Projects/(find ~/Projects -maxdepth 2 -type d -print | cut -d '/' -f5,6 | fzf -1 -q "$argv[1]")
end
