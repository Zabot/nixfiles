{ config, pkgs, ... }:

{
  imports = [
    ./i3.nix
    ./alacritty.nix
    ./vim.nix
    ./email.nix
    ./git.nix
    ./zsh.nix
  ];

  home = {
    stateVersion = "21.05";
    username = "zach";
    homeDirectory = "/home/zach";
    packages = [
      pkgs.htop
      pkgs.keepassxc
      pkgs.ripgrep
      pkgs.libnotify
      pkgs.weechat
      pkgs.weechatScripts.wee-slack
      pkgs.python38
      pkgs.python38Packages.poetry
      pkgs.ledger
    ];
  };

  programs.home-manager.enable = true;
  programs.firefox.enable = true;
  programs.rofi.enable = true;
  programs.neomutt.enable = true;

  services.udiskie.enable = true;
  services.udiskie.automount = true;
  services.imapnotify.enable = true;

  services.random-background.enable = true;
  services.random-background.imageDirectory = "/etc/nixos/wallpaper";
}
