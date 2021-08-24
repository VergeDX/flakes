{ programs, pkgs, home, ... }:
{
  programs.git.enable = true;
  programs.git.userName = "Vanilla";
  programs.git.userEmail = "neko@hydev.org";

  home.packages = with pkgs; [ gh pinentry-curses diff-so-fancy ];

  programs.git.includes = [
    {
      path = # Version: 24.0.0
        let rev = "d62654999ec27d7b7689a1938927045e99be4088"; in
        (pkgs.fetchurl {
          url = "https://raw.githubusercontent.com/GitAlias/gitalias/${rev}/gitalias.txt";
          sha256 = "sha256-LenGqB6ZaEt6Cz8ACpIDXXLpOqVbK/kof0tUJWgyAwY=";
        }).outPath;
    }
  ];

  programs.git.extraConfig = {
    init.defaultBranch = "master";
    core.editor = "nvim";

    # merge (the default strategy)
    pull.rebase = false;
  };

  programs.ssh.enable = true;
  programs.ssh.matchBlocks."git@github.com" = {
    host = "github.com";
    user = "git";
    proxyCommand = "nc -x 127.0.0.1:7890 %h %p";
  };

  programs.gpg.enable = true;
  home.file.".gnupg/gpg-agent.conf".text =
    "pinentry-program ${pkgs.pinentry-curses}/bin/pinentry";
  programs.fish.shellInit = "export GPG_TTY=(tty)";

  programs.git.signing.key = "4DFA2BDD7305E739";
  programs.git.signing.signByDefault = true;

  programs.git.extraConfig = {
    pack = {
      windowMemory = "2g";
      packSizeLimit = "1g";
    };
  };
}
