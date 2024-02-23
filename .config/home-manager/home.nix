{ config, pkgs, ... }:

let
  packages = with pkgs; [
    aspell
    aspellDicts.en
    catgirl
    dig
    fzf
    git
    graphviz
    htop
    ipcalc
    jq
    magic-wormhole
    mosh
    oci-cli
    pdsh
    python3
    ripgrep
    silver-searcher
    sshfs
    tmux
    tree
    unzip
    watch
    wget
    whois
    zip
  ];
  guiPackages = with pkgs; [
    brightnessctl
    calibre
    dunst
    feh
    firefox
    font-awesome
    kitty
    maim
    pulsemixer
    rofi
    source-code-pro
    wireshark
    xclip
    xdotool
    xsecurelock
  ];

in
{
  home.username = "kyle";
  home.homeDirectory = if pkgs.stdenv.isDarwin then "/Users/kyfuller" else "/home/kyle";
  home.stateVersion = "23.05";
  home.packages = packages ++ (pkgs.lib.lists.optionals pkgs.stdenv.isLinux guiPackages);
  home.sessionVariables = {
    MANPAGER = "nvim -n +Man!";
    FZF_DEFAULT_COMMAND = "ag -g \\\"\\\"";
    PATH = "$HOME/.local/bin:$PATH";
    PYTHONSTARTUP = "$HOME/.pystartup";
  };

  programs.fish = {
    enable = true;
    shellInit = if pkgs.stdenv.isDarwin then ''
      source /nix/var/nix/profiles/default/etc/profile.d/nix.fish
      source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
    '' else "";
    interactiveShellInit = ''
      set fish_greeting
    '';
    shellAliases = {
      pbcopy = "xclip -selection clipboard";
      pbpaste = "xclip -selection clipboard -out";
      pbkey = "ssh-add -L | pbcopy";
      h = "env GIT_WORK_TREE=$HOME GIT_DIR=$HOME/.files.git";
    };
  };
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  programs.home-manager.enable = true;

  services.polybar.enable = true;
  services.polybar.package = pkgs.polybar.override { pulseSupport = true; };
  services.polybar.script = "polybar top &";

  services.redshift = {
    enable = true;
    provider = "manual";
    latitude = "51.6";
    longitude = "-0.1";
  };
}
