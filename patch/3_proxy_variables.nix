{ ... }:
{
  # https://github.com/NixOS/nix/issues/1669
  # https://stackoverflow.com/a/26477515/166289
  environment.launchDaemons."3_proxy_variables" = {
    enable = true;
    target = "3_proxy_variables.plist";

    text = ''
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
        <dict>
          <key>Label</key>
          <string>environment</string>
          <key>ProgramArguments</key>
          <array>
            <string>sh</string>
            <string>-c</string>

            <string>launchctl setenv https_proxy http://127.0.0.1:7890</string>
            <string>launchctl setenv http_proxy http://127.0.0.1:7890</string>
            <string>launchctl setenv all_proxy socks5://127.0.0.1:7890</string>

            <!-- Reload nix-daemon after set proxy environment variable. -->
            <string>launchctl kickstart -k system/org.nixos.nix-daemon</string>
          </array>
          <key>KeepAlive</key>
          <false/>
          <key>RunAtLoad</key>
          <true/>
          <key>WatchPaths</key>
          <array>
            <string>/etc/environment</string>
          </array>
        </dict>
      </plist>
    '';
  };
}
