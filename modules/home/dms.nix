{ ... }: {
  programs.dank-material-shell = {
    enable = true;

    niri = {
      enableSpawn = true;    # start with niri, fixes grey flash
      enableKeybinds = true;
      includes.enable = true;
    };

    enableSystemMonitoring = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableClipboardPaste = true;
  };
} 