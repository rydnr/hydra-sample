{
  description = "A flake for building a simple 'hello.c' program";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable"; };

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };

      helloSrc = pkgs.fetchFromGitHub {
        owner = "rydnr";
        repo = self.name;
        rev = self.rev;
        sha256 = self.checksum;
      };

      hello = pkgs.stdenv.mkDerivation {
        name = "hello";
        src = ./.;
        phases = [ "buildPhase" ];
        buildPhase = ''
          gcc -o hello hello.c
        '';
      };
    in { defaultPackage = hello; };
}
