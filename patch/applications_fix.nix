{ lib, config, ... }:
let me = "vanilla";
in
{
  # https://github.com/LnL7/nix-darwin/issues/139
  system.activationScripts.applications.text = lib.mkForce (
    ''
      echo "setting up ~/Applications/Nix..."

      rm -rf ~/Applications/Nix && mkdir -p ~/Applications/Nix
      chown ${me} ~/Applications/Nix

      IFS='
      '

      for app in $(find ${config.system.build.applications}/Applications -maxdepth 1 -type l); do
        src="$(/usr/bin/stat -f%Y "$app")" && appname="$(basename $src)"
        osascript -e "tell app \"Finder\" to make alias file at POSIX file \"/Users/${me}/Applications/Nix/\" to POSIX file \"$src\" with properties {name: \"$appname\"}";
      done
    ''
  );
}
