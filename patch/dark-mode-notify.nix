{ home, pkgs, ... }:
{
  # https://github.com/bouk/dark-mode-notify
  # https://arslan.io/2021/02/15/automatic-dark-mode-for-terminal-applications/
  home.file."Library/LaunchAgents/ke.bou.dark-mode-notify.plist".text = ''
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>ke.bou.dark-mode-notify</string>
        <key>KeepAlive</key>
        <true/>
        <key>ProgramArguments</key>
        <array>
          <string>/usr/local/bin/dark-mode-notify</string>
          <string>/run/current-system/sw/bin/fish</string>
          <string>-c</string>
          <string>match_theme</string>
        </array>
      </dict>
    </plist>
  '';
}
