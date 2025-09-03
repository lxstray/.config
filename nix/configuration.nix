{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "sussy"; 
  networking.networkmanager.enable = true;  

  time.timeZone = "Asia/Tokyo";

  nix.settings.experimental-features = ["nix-command" "flakes"];

  #WM
  programs.hyprland.enable = true;

  #GC
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  #font
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];
  };
  
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  users.users.mikita = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; 
  };

  environment.systemPackages = with pkgs; import ./packages.nix { inherit pkgs inputs; };
  system.stateVersion = "25.05"; 
}

