{ config, pkgs, ... }:

let
  packages = with pkgs; [
    aspell
    aspellDicts.en
    catgirl
    dig
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
    ledger
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
  home.homeDirectory = (if pkgs.stdenv.isDarwin then "/Users/" else "/home/") + "kyle";
  home.stateVersion = "23.05";
  home.packages = packages ++ (pkgs.lib.lists.optionals pkgs.stdenv.isLinux guiPackages);
  home.sessionVariables = {
    MANPAGER = "nvim -n +Man!";
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
    plugins = with pkgs.vimPlugins; [
      # theme
      jellybeans-vim

      vim-sensible

      # project
      ack-vim
      ale
      fzf-vim
      nerdtree
      tagbar
      vim-test
      vimux

      # git
      vim-fubitive  # fugitive + bitbucket
      vim-fugitive
      vim-gitgutter
      vim-rhubarb  # fugitive + github

      # languages
      swift-vim
      typescript-vim
      vim-fish
      vim-flake8
      vim-ledger
      vim-nix
      vim-terraform
      vim-toml

      # lsp
      nvim-lspconfig
      nvim-cmp
      cmp-buffer
      cmp-nvim-lsp
      vim-vsnip
      cmp-vsnip
    ];
  };
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  programs.home-manager.enable = true;

  programs.fzf = {
    enable = true;
    defaultCommand = "${pkgs.silver-searcher}/bin/ag -g \\\"\\\"";
  };

  services.sxhkd.enable = pkgs.stdenv.isLinux;
  services.sxhkd.keybindings = {
    "super + Return" = "${pkgs.kitty}/bin/kitty";
    "super + b" = "${pkgs.firefox}/bin/firefox";
    "super + shift + b" = "${pkgs.firefox}/bin/firefox --private-window";
    "super + space" = "${pkgs.rofi}/bin/rofi -show combi";
    "super + BackSpace" = "${pkgs.xsecurelock}/bin/xsecurelock";
    "super + shift + @BackSpace" = "${pkgs.xsecurelock}/bin/xsecurelock -- systemctl suspend";
    "super + s" = "${pkgs.maim}/bin/maim -s ~/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png";

    "super + q" = "bspc node -c";

    "super + {_, shift +} {1-9,0}" = "bspc {desktop -f,node -d} '^{1-9,10}'";
    "super + {_,shift +} {Left,Down,Up,Right}" = "bspc node -{f,s} {west,south,north,east}";
    "super + alt + {Left,Down,Up,Right}" = "bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}";
    "super + Tab" = "bspc desktop -f last";

    "XF86MonBrightness{Down,Up}" = "${pkgs.brightnessctl}/bin/brightnessctl set {10%-,+10%}";
    "XF86Audio{Lower,Raise}Volume" = "${pkgs.pamixer}/bin/pamixer -{d,i} 5";
    "XF86AudioMute" = "${pkgs.pamixer}/bin/pamixer -t";
    "XF86ScreenSaver" = "${pkgs.xsecurelock}/bin/xsecurelock";
  };

  services.polybar.enable = pkgs.stdenv.isLinux;
  services.polybar.package = pkgs.polybar.override { pulseSupport = true; };
  services.polybar.script = "polybar top &";

  services.redshift = {
    enable = pkgs.stdenv.isLinux;
    provider = "manual";
    latitude = "51.6";
    longitude = "-0.1";
  };
}
