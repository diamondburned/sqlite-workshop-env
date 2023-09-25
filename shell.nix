{ pkgs ? import <nixpkgs> {} }:

let
  python3 = pkgs.python3.withPackages (ps: with ps; [
    black
  ]);
in

pkgs.mkShell {
  buildInputs = with pkgs; [
    python3
    pyright
		sqlite
  ];

  shellHook = ''
    python3 -m venv .venv
    source .venv/bin/activate
  '';

	FLASK_APP = "app";
	FLASH_ENV = "development";
}
