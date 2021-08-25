{ config, pkgs, ... }:
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
    ../config/common/git.nix
    ../config/common/cli.nix
    ../config/common/gui.nix
    ../config/common/develop.nix

    ../config/common/neovim.nix
    ../config/darwin-extra/neovim.nix
    ../config/common/shells.nix
    ../config/darwin-extra/shells.nix
    ../config/common/vscode.nix

    ../config/common/myRepos.nix
    ../patch/dark-mode-notify.nix
  ];

  home.sessionVariables = {
    https_proxy = "http://127.0.0.1:7890";
    http_proxy = "http://127.0.0.1:7890";
    all_proxy = "socks5://127.0.0.1:7890";
  };
}
