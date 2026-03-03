{ ... }: {
  programs.dank-material-shell = {
    enable = true;

    niri = {
      enableSpawn = true;    # start with niri, fixes grey flash
      enableKeybinds = true;
    };

    enableSystemMonitoring = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableClipboardPaste = true;
  };
} 