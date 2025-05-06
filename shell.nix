# Holt dependencies für die GTK4 Anwendung,
# mit dem Befehl nix-shell. 
# Falls nix-shell installiert ist.

{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  buildInputs = [
    pkgs.python3
    pkgs.python3Packages.pygobject3
    pkgs.gobject-introspection
    pkgs.glib
    pkgs.gtk4
    pkgs.cairo
  ];

  shellHook = ''
    echo "GTK4 Entwicklungsumgebung aktiviert."
  '';
}
