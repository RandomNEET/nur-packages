# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `overlays`,
# `nixosModules`, `homeModules`, `darwinModules` and `flakeModules`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage

{
  pkgs ? import <nixpkgs> { },
}:

{
  # The `lib`, `overlays`, `nixosModules`, `homeModules`,
  # `darwinModules` and `flakeModules` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  nixosModules = import ./nixos-modules; # NixOS modules
  # homeModules = { }; # Home Manager modules
  # darwinModules = { }; # nix-darwin modules
  # flakeModules = { }; # flake-parts modules
  overlays = import ./overlays; # nixpkgs overlays

  fcitx5-rime-ice = pkgs.callPackage ./pkgs/fcitx5-rime-ice { };
  npmPackages = {
    obsidian-headless = pkgs.callPackage ./pkgs/npm-packages/obsidian-headless { };
  };
  hyprlandPlugins = {
    hyprspace = (pkgs.callPackage ./pkgs/hyprland-plugins { }).hyprspace;
  };
  obsidianPlugins = {
    livesync = pkgs.callPackage ./pkgs/obsidian-plugins/livesync { };
    trash-explorer = pkgs.callPackage ./pkgs/obsidian-plugins/trash-explorer { };
  };
  tmuxPlugins = {
    dotbar = (pkgs.callPackage ./pkgs/tmux-plugins { }).dotbar;
  };
  vscode-extensions = {
    CL.eide = pkgs.callPackage ./pkgs/vscode-extensions/CL.eide { };
    mcu-debug = {
      debug-tracker-vscode = pkgs.callPackage ./pkgs/vscode-extensions/mcu-debug.debug-tracker-vscode { };
      memory-view = pkgs.callPackage ./pkgs/vscode-extensions/mcu-debug.memory-view { };
      peripheral-viewer = pkgs.callPackage ./pkgs/vscode-extensions/mcu-debug.peripheral-viewer { };
      rtos-views = pkgs.callPackage ./pkgs/vscode-extensions/mcu-debug.rtos-views { };
    };
    ms-vscode = {
      vscode-serial-monitor =
        pkgs.callPackage ./pkgs/vscode-extensions/ms-vscode.vscode-serial-monitor
          { };
    };
  };
}
