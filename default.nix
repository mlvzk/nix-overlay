self: super: {
    dwm-mlvzk = super.callPackage ./pkgs/dwm/mlvzk.nix { };
    st-mlvzk = super.callPackage ./pkgs/st/mlvzk.nix { };
}
