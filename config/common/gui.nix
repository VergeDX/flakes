{ home, pkgs, ... }:
let
  metro-for-steam = pkgs.callPackage ../../pkgs/metro-for-steam.nix { };
  kitty_themes_baseurl = "https://github.com/dexpota/kitty-themes/raw/master/themes";
in
{
  home.packages = [ pkgs.gimp ];
  home.file."Library/Application Support/Steam/Steam.AppBundle/Steam/Contents/MacOS/skins/".source = metro-for-steam;

  programs.kitty.enable = true;
  # programs.kitty.font.package = pkgs.nerdfonts;
  programs.kitty.font.name = "Hack Nerd Font Mono";

  # https://github.com/kovidgoyal/kitty/issues/1792
  # https://github.com/dexpota/kitty-themes/blob/master/README.md#previews
  programs.kitty.settings = {
    macos_quit_when_last_window_closed = "yes";

    # https://sw.kovidgoyal.net/kitty/conf/?highlight=listen_on#opt-kitty.listen_on
    # https://sw.kovidgoyal.net/kitty/invocation/#cmdoption-kitty-listen-on
    # https://sw.kovidgoyal.net/kitty/remote-control/?highlight=#cmdoption-kitty-to
    allow_remote_control = "yes";
    listen_on = "unix:/tmp/mykitty";

    # https://sw.kovidgoyal.net/kitty/conf/#window-layout
    remember_window_size = "no";
    initial_window_width = 640;
    initial_window_height = 400;
  };
}
