{ config, pkgs, ... }:

{
  home.username = "nixos";
  home.homeDirectory = "/home/nixos";
  home.stateVersion = "26.05";

  home.sessionVariables = {
    SSH_AUTH_SOCK = "/run/user/1000/ssh-agent";
  };

  home.packages = with pkgs; [
    dust
    duf
    yq-go
    xh
    ripgrep
    fd
    hyperfine
  ];

  programs.bash = {
    enable = true;

    shellAliases = {
      ll = "eza -lah --icons";
      ls = "eza --icons";
      lt = "eza --tree --level=2 --icons";

      cat = "bat";
      grep = "rg";

      gs = "git status";
      gl = "git log --oneline --graph --decorate";
      gd = "git diff";
    };
  };

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

  programs.ssh = {
  enable = true;
  enableDefaultConfig = false;

  settings = {
    "github.com" = {
      HostName = "github.com";
      User = "git";
      IdentityFile = "~/.ssh/id_ed25519_github";
      IdentitiesOnly = true;
    };

    "*" = {
      AddKeysToAgent = "yes";
    };
  };
};


  services.ssh-agent.enable = true;

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.atuin = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableBashIntegration = true;
    icons = "auto";
  };

  programs.bat.enable = true;

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;

    nix-direnv.enable = true;
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };
}
