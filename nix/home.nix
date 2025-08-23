{ config, pkgs, inputs, ... }: {
	home = {
		username = "mikita";
		homeDirectory = "/home/mikita";
		stateVersion = "25.05";
	};
	programs.bash = {
		enable = true;
		shellAliases = {
			rb = "sudo nixos-rebuild switch --flake ~/.config/nix";
			vim = "nvim";
		};
	};
	imports = [
		inputs.zen-browser.homeModules.twilight
	];

	programs.zen-browser.enable = true;
}
