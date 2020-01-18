{ reflex-platform ? import ../.. { hideDeprecated = true; } }:

let
  inherit (reflex-platform)
    nixpkgs
    tryReflexPackages
    ;
in

(import "${nixpkgs.path}/nixos" {
  configuration = {
    imports = [
      "${nixpkgs.path}/nixos/modules/virtualisation/virtualbox-image.nix"
      "${nixpkgs.path}/nixos/modules/profiles/demo.nix"
    ];
    environment.systemPackages = nixpkgs.lib.filter (a: a != null) tryReflexPackages;
    nixpkgs = { localSystem.system = "x86_64-linux"; };
  };
}).config.system.build.virtualBoxOVA
