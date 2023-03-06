{ nixpkgs ? <nixpkgs> }:
let pkgs = import nixpkgs { };
in { myapp = pkgs.writeShellScript "hello" "${pkgs.hello}/bin/hello"; }
