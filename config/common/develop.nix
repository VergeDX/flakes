{ home, pkgs, ... }:
{
  home.packages = [
    pkgs.nodejs
    pkgs.yarn

    pkgs.nodePackages.yo
    pkgs.nodePackages.generator-code
    pkgs.nodePackages.code-theme-converter

    pkgs.openocd
    pkgs.stm32cubemx

    # https://github.com/ppy/osu
    pkgs.dotnet-sdk_5
    pkgs.mono

    pkgs.rust-bin.stable.latest.default
    pkgs.rust-bin.stable.latest.rust-src

    pkgs.ghc
    pkgs.stack
  ];

  # https://formulae.brew.sh/formula/openjdk@8
  home.file.".config/flutter/settings".text = builtins.toJSON {
    "enable-macos-desktop" = true;
    "android-sdk" = "/Users/vanilla/Android/sdk";
  };

  # https://stackoverflow.com/questions/60054531/how-can-i-solve-the-connection-problem-during-npm-install-behind-a-proxy
  home.sessionVariables = {
    ELECTRON_GET_USE_PROXY = true;
    GLOBAL_AGENT_HTTPS_PROXY = "http://127.0.0.1:7890";

    DOTNET_CLI_TELEMETRY_OPTOUT = 1; # or true.
    DOTNET_SKIP_FIRST_TIME_EXPERIENCE = true;

    # https://mirrors.bfsu.edu.cn/help/flutter/
    FLUTTER_STORAGE_BASE_URL = "https://mirrors.bfsu.edu.cn/flutter";
    PUB_HOSTED_URL = "https://mirrors.bfsu.edu.cn/dart-pub";
  };

  home.file."Library/Application Support/code-oss-dev/User/settings.json".text = builtins.toJSON {
    "window.autoDetectColorScheme" = true;
  };
}
