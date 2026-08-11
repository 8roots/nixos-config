{ config, pkgs, ... }:

{
  home.username = "nixos";
  home.homeDirectory = "/home/nixos";

  home.stateVersion = "26.05";

  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "8roots";
        email = "8roots@proton.me";
      };

      init.defaultBranch = "main";
    };
  };
}
