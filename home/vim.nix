{ config, lib, pkgs,  ... }:
let
  vim-gas = pkgs.vimUtils.buildVimPlugin {
    name = "vim-gas";
    src = pkgs.fetchFromGitHub {
      owner = "Shirk";
      repo = "vim-gas";
      rev = "c6da2e0f6663c6b1dbd954c55324035e59636f31";
      sha256 = "0y2dyksi1fbwgr8fg98bxrz4wcc7pl9aymbciml357yaq5bs8hx8";
    };
  };
in {
  programs.vim = {
    enable = true;
    plugins = [
      vim-gas
      pkgs.vimPlugins.vim-colors-solarized
      pkgs.vimPlugins.vim-tmux-navigator
      pkgs.vimPlugins.vim-airline
      pkgs.vimPlugins.vim-airline-themes
      pkgs.vimPlugins.nerdcommenter
      pkgs.vimPlugins.YouCompleteMe
      pkgs.vimPlugins.vim-better-whitespace
      pkgs.vimPlugins.vim-flake8
      pkgs.vimPlugins.vim-go
      pkgs.vimPlugins.vim-nix
      pkgs.vimPlugins.vim-ledger
    ];

    # Don't bother trying to translate the whole vimrc
    extraConfig = builtins.readFile ./vimrc
  };
}
