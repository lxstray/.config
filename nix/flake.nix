{
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		zen-browser.url = "github:0xc000022070/zen-browser-flake";

		neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, home-manager, zen-browser, ...} @ inputs: {
		nixosConfigurations.sussy = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			specialArgs = { inherit inputs; };
			modules = [ ./configuration.nix ];
		};

		homeConfigurations.mikita = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages."x86_64-linux";
			modules = [ ./home.nix ];
		};
	};

}
