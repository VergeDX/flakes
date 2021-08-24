{ callPackage, pkgs }:
let
  fetchDarwinApps = callPackage ../fn/fetch-darwin-apps.nix { };

  txBaseUrl = "https://dldir1.qq.com";
  buildGhUrl = repo: dl: "https://github.com" + repo + "releases/download/" + dl;
  # https://github.com/NixOS/nixpkgs/blob/nixpkgs-unstable/pkgs/applications/editors/jetbrains/default.nix
  jbBaseUrl = "https://download.jetbrains.com";
in
[
  (fetchDarwinApps "clashX" "1.65.1" "ClashX"
    "https://github.com/yichengchen/{0}/releases/download/{1}/{2}.dmg"
    "sha256-yb/7lzqSbKS3WywZgl/0dPT9f3gD9kgGbbViiboPKPs=")
] ++ [
  # Folder: Social
  (fetchDarwinApps "tdesktop" "2.9.3" "Telegram Desktop"
    "https://updates.{0}.com/tmac/tsetup.{1}.dmg"
    "sha256-/jlJEVMl/LI9Hjq2b8m+raK0+occ6XlvK7xKmfFjYds=")
  (fetchDarwinApps "qq-beta" "8.4.10.118" "QQ"
    "${txBaseUrl}/qqfile/{2}forMac/{2}Catalyst/{2}_{1}.dmg"
    "sha256-3tdEZD241ZEsuW2JIyeGpV62wI1+AZjHSVxyeNKBfRY=")
  (fetchDarwinApps "zoom" "5.7.5.1123" "zoomus.pkg"
    "https://cdn.{0}.us/prod/{1}/Zoom.pkg"
    "sha256-W8YyFgxRAugcYUzG36gmQVJ6ZmUZRbIIOspGdrHxiBk=")
] ++ [
  # Folder: IDE
  (fetchDarwinApps "android-studio" "2020.3.1.23" "Android Studio - Arctic Fox | 2020.3.1 Patch 1"
    "https://redirector.gvt1.com/edgedl/android/studio/install/{1}/{0}-{1}-mac.dmg"
    "sha256-Lo/XW2FMXEjLPfH72R0W5GwJqFvR2/RYF3u+6LgrLn4="
  )
  (fetchDarwinApps "appcode" "2021.1.3" "AppCode"
    "${jbBaseUrl}/objc/{2}-{1}.dmg"
    "sha256-t8LlJWEosUkRsEcvdNcnDZ4bx/9Wl9KM34Mz7Hx4ENY=")
  (fetchDarwinApps "clion" "2021.2" "CLion"
    "${jbBaseUrl}/cpp/{2}-{1}.dmg"
    "sha256-umX/qNXJpC9w0wb2d/7BU+H2UQ107exuJkg/aUYKRX0=")
  (fetchDarwinApps "idea-ultimate" "2021.2" "IntelliJ IDEA"
    "${jbBaseUrl}/idea/ideaIU-{1}.dmg"
    "sha256-wj7p9oq71QPlAZx0XMW/KjCPgejCu9IQzPr7wRJMHlk=")
  (fetchDarwinApps "rider" "2021.2" "Rider"
    "${jbBaseUrl}/{0}/JetBrains.{2}-{1}.dmg"
    "sha256-MHpW++B0j2Ussf8DxMxjbZZWd4aBwrZ7AggMrSd9etw=")
  (fetchDarwinApps "visual-studio" "8.10.7.17" "Visual Studio"
    "https://dl.xamarin.com/VsMac/VisualStudioForMac-{1}.dmg"
    "sha256-m5K6feDxQexnE3mLZFrkcFoOEqCyYN79C0oU99TEHBU=")
  (fetchDarwinApps "webstorm" "2021.2" "WebStorm"
    "${jbBaseUrl}/{0}/{2}-{1}.dmg"
    "sha256-edAnWOl971vHt2IdCbLTRwRj6ktk1pFNj5nXhAjM4qY=")
] ++ [
  # Folder: None
  (fetchDarwinApps "yubikey-manager-qt" "1.2.3" "com.yubico.ykman.pkg"
    "https://developers.yubico.com/{0}/Releases/{0}-{1}-mac.pkg"
    "sha256-Y3FF0UyY7kJ7d7syx9BcaATRd1oD6EuYKql3WoRztSc=")
  (fetchDarwinApps "motrix" "1.6.11" "Motrix"
    "https://github.com/agalwood/{2}/releases/download/v{1}/{2}-{1}-mac.zip"
    "sha256-7fBYB/rkZMiRRmuJVOsuDnTEOB4iQFe2gIdq8vwMXNE=")
] ++ [
  # Folder: Auto Start & Extensions
  (fetchDarwinApps "scroll-reverser" "1.8.1" "ScrollReverser"
    "https://pilotmoon.com/downloads/ScrollReverser-{1}.zip"
    "sha256-9lGjjW/lhTStfY3dWqqm4XecgY/zAILZv/7zef7mKis=")
  (fetchDarwinApps "one-switch" "322" "OneSwitch"
    "https://fireball.studio/api/release_manager/downloads/studio.fireball.{2}/{1}.zip"
    "sha256-Zhjgy83E3W3DJwMwOhdqrJGfmzyECTjfmdHHJBkEzLk=")
  (fetchDarwinApps "openinterminal" "2.3.3" "OpenInTerminal"
    "https://github.com/Ji4n1ng/{2}/releases/download/v{1}/{2}.app.zip"
    "sha256-VN++jSG0y0aIXtXrw0/t+Dgqz+tQBAgo1SsKC4p8iFs=")
  (fetchDarwinApps "snipaste" "2.6.6-Beta2" "Snipaste"
    "https://bitbucket.org/liule/{0}/downloads/{2}-{1}.dmg"
    "sha256-hYKwRbNAzDKNn6uao3aZ9rtzEqOMeyhHZoR4/G/q2RM=")
] ++ [
  # Folder: Virtualization
  (fetchDarwinApps "docker" "67351" "Docker"
    "https://desktop.{0}.com/mac/stable/amd64/{1}/{2}.dmg"
    "sha256-CMkb6PeExBtneyj27qKn7AAeC4ErsO6XjRwLYOzqd7s=")
] ++ [
  # Folder: None (Outside)
  (fetchDarwinApps "neteasemusic" "2.3.5_856" "网易云音乐"
    "https://d1.music.126.net/dmusic/NeteaseMusic_{1}_web.dmg"
    "sha256-zkcGKvm5rL9AexzYuxo/eYsodys46yuR3dByYLvhNqw=")
  (fetchDarwinApps "baidunetdisk" "3.9.1" "百度网盘"
    "https://wppkg.baidupcs.com/issue/netdisk/MACguanjia/BaiduNetdisk_mac_{1}.dmg"
    "sha256-0tBxYTp/CWPwaqubZxkTagGzayxfgsV7uvL7QVbFlW4=")
]

