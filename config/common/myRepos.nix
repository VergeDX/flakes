{ home }:
let
  mrConfig = { path, url, repo }: ''
    [${path}]
    checkout = git clone '${url}' '${repo}'
  '';

  ghMrConfig = owner: repo: mrConfig {
    path = "Documents/${repo}";
    url = "git@github.com:${owner}/${repo}.git";
    inherit repo;
  };
in
{
  home.file.".mrconfig".text = builtins.concatStringsSep "\n" [
    (ghMrConfig "bouk" "dark-mode-notify")
    (ghMrConfig "NixOS" "nixpkgs")
    (ghMrConfig "VergeDX" "menubar_runcat")
    (ghMrConfig "corpnewt" "ProperTree")
    (ghMrConfig "ppy" "osu")
    (ghMrConfig "VergeDX" "config-nixpkgs")
    (ghMrConfig "Vanilla-s-Lab" "vps-nixos-config")
  ];
}
