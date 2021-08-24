{ config, pkgs, ... }:
let
  vergedx_config_baseurl = "https://github.com/VergeDX/config-nixpkgs/raw/master/config";
  neovim_config = (builtins.fetchurl {
    url = "${vergedx_config_baseurl}/neovim.nix";
    sha256 = "1yxmlbqd2ky6sfc5agdfqmk1l6m1svgmpiqb73snadhjnl6a1n8v";
  });
  shells_config = (builtins.fetchurl {
    url = "${vergedx_config_baseurl}/shells.nix";
    sha256 = "01fmf7km7xx8qr0mvpzfa595kzxzd7dzrgf8kk675shs05wm3r9m";
  });
  vscode_config = (builtins.fetchurl {
    url = "${vergedx_config_baseurl}/vscode.nix";
    sha256 = "0k97f4xrrp070wdqwskcb0xp8nw9k2x9mqcacadvpl8ihpg6x5g8";
  });
in
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "vanilla";
  home.homeDirectory = "/Users/vanilla";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";

  home.packages = with pkgs; [
    nixpkgs-fmt
    update-nix-fetchgit
  ];

  nixpkgs.config.allowUnfree = true;
  imports = [
    ./common/git.nix
    ./common/cli.nix
    ./common/gui.nix
    ./common/develop.nix

    # neovim_config
    ./darwin-extra/neovim.nix
    shells_config
    ./darwin-extra/shells.nix
    vscode_config
    ../pkgs/dark-mode-notify.nix
  ];

  home.sessionVariables = {
    https_proxy = "http://127.0.0.1:7890";
    http_proxy = "http://127.0.0.1:7890";
    all_proxy = "socks5://127.0.0.1:7890";
  };
}
