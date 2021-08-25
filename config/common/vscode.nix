{ home, pkgs, ... }:
{
  programs.vscode.enable = true;
  programs.vscode.package =
    pkgs.callPackage ../../pkgs/vscode-with-extensions.nix { };

  programs.vscode.userSettings = {
    # https://github.com/doki-theme/doki-theme-vscode/tree/master/buildSrc/assets/themes/reZero
    # "workbench.colorTheme" = "e828aaae-aa8c-4084-8993-d64697146930";
    "window.autoDetectColorScheme" = true;
    "workbench.preferredLightColorTheme" = "e828aaae-aa8c-4084-8993-d64697146930";
    "workbench.preferredDarkColorTheme" = "696de7c1-3a8e-4445-83ee-3eb7e9dca47f";

    # https://copilot.github.com/
    "editor.inlineSuggest.enabled" = true;
    "github.copilot.autocomplete.enable" = true;
    "github.copilot.enable" = {
      "*" = true;
      "yaml" = false;
      "plaintext" = true;
      "markdown" = true;
    };

    # https://github.com/tobiasalthoff/vscode-atom-material-theme#recommended-settings
    "editor.fontSize" = 16;
    "editor.lineHeight" = 1.5;
    "editor.letterSpacing" = 0.5;

    # https://github.com/microsoft/vscode/blob/1.58.0/src/vs/editor/common/config/editorOptions.ts#L3857
    "editor.fontFamily" = "'Jetbrains Mono', 'Hack'";

    # https://dartcode.org/docs/recommended-settings/
    "debug.openDebug" = "openOnDebugBreak";
    "[dart]" = {
      "editor.formatOnSave" = true;
      "editor.formatOnType" = true;
      "editor.rulers" = [ 80 ];
      "editor.selectionHighlight" = false;
      "editor.suggest.snippetsPreventQuickSuggestions" = false;
      "editor.suggestSelection" = "first";
      "editor.tabCompletion" = "onlySnippets";
      "editor.wordBasedSuggestions" = false;
    };

    "update.mode" = "none";

    # https://code.visualstudio.com/docs/supporting/faq#_how-to-disable-telemetry-reporting
    "telemetry.enableTelemetry" = false;
    "workbench.enableExperiments" = false;
    "extensions.autoUpdate" = false;
  };
}
