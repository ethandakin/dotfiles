{ ... }: {
  programs.dank-material-shell = {
    enable = true;

    niri = {
      enableKeybinds = true;
      includes.enable = true;
    };

    systemd = {
      enable = true;             # Systemd service for auto-start
      restartIfChanged = true;   # Auto-restart dms.service when dank-material-shell changes
    };

    enableSystemMonitoring = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableClipboardPaste = true;
  };
} 