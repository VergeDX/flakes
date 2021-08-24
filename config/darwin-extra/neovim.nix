{ programs, ... }:
{
  # https://arslan.io/2021/02/15/automatic-dark-mode-for-terminal-applications/
  # https://neovim.io/doc/user/autocmd.html
  # https://vi.stackexchange.com/questions/19773/get-exit-status-from-system-call
  programs.neovim.extraConfig = ''
    function! MatchColorScheme()
      let output = system("defaults read -g AppleInterfaceStyle")
      if v:shell_error != 0
        colorscheme emilia_light
      else
        colorscheme emilia_dark
      endif
    endfunction

    call MatchColorScheme()
    autocmd Signal SIGUSR1 call MatchColorScheme()
  '';
}
