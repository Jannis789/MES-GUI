# This file is deprecated. Use flake.nix instead.
{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.python3
    pkgs.gtk4
    pkgs.glib
    pkgs.gobject-introspection
    pkgs.graphene
    pkgs.pango
    pkgs.cairo
    pkgs.harfbuzz
    pkgs.python3Packages.pygobject3  # This should be the correct Python package for pygobject3
  ];

  # Ensure that the GI_TYPELIB_PATH and PYTHONPATH are set correctly
  shellHook = ''
    chmod +x ${pkgs.python3}/bin/python3  # Ensure the Python binary is executable
    export GI_TYPELIB_PATH=${pkgs.glib.out}/lib/girepository-1.0:\
${pkgs.gtk4.out}/lib/girepository-1.0:\
${pkgs.graphene.out}/lib/girepository-1.0:\
${pkgs.pango.out}/lib/girepository-1.0:\
${pkgs.cairo.out}/lib/girepository-1.0:\
${pkgs.harfbuzz.out}/lib/girepository-1.0:\
${pkgs.gdk-pixbuf.out}/lib/girepository-1.0

    # Set PYTHONPATH to include the correct locations for the Python bindings
    export PYTHONPATH=${pkgs.python3Packages.pygobject3}/lib/python3.12/site-packages:$PYTHONPATH
    export MY_PYTHON="${pkgs.python3}/bin/python3"
  '';
}

