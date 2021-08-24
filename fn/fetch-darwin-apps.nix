{ pkgs }:
# https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.text/take-last.html
let stringTakeLast =
  str: last:
  let strLen = pkgs.lib.stringLength str;
  in pkgs.lib.substring (strLen - last) strLen str;
in
name: version: location: holderLink: sha256:
let supportFmt = [ "dmg" "pkg" "zip" ]; in
pkgs.stdenv.mkDerivation rec {
  inherit name version;

  fileType = let extName = stringTakeLast holderLink 3; in
    if builtins.elem extName supportFmt then extName
    else abort "Unsupported compression file types: ${extName}";

  src = pkgs.fetchurl {
    url = builtins.replaceStrings [ "{0}" "{1}" "{2}" ] [ name version location ] holderLink;
    sha256 = sha256;

    # https://discourse.nixos.org/t/how-to-change-the-user-agent-used-by-fetchurl/4987/2
    # https://github.com/Homebrew/homebrew-cask/blob/master/Casks/neteasemusic.rb
    curlOpts = "-A :fake";
  };

  nativeBuildInputs = [ pkgs.xar pkgs.cpio pkgs.p7zip ];
  # https://stackoverflow.com/questions/11298855/how-to-unpack-and-pack-pkg-file
  unpackPhase =
    if fileType == "dmg" then ''
      echo y | /usr/bin/hdiutil attach ${src}
      cd "/Volumes/${location}"
    '' else if fileType == "pkg" then ''
      xar -xf ${src} && cd ${location}
      cat Payload | gunzip -dc | cpio -i
    '' else if fileType == "zip" then "7z x ${src}"
    else abort "No implement compress format: ${fileType}";

  configurePhase = "echo";
  installPhase = ''
    mkdir -p $out/Applications/
    ls | grep ".app$" | head -n 1 | xargs -I {} cp -r {} $out/Applications/
  '';
}
