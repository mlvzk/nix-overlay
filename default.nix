self: super:
let
  unstable = import <unstable> {};
  sources = import ./nix/sources.nix;
in {
  dwm-mlvzk = super.callPackage ./pkgs/dwm/mlvzk.nix {};
  st-mlvzk = super.callPackage ./pkgs/st/mlvzk.nix {};
  kakoune-git = super.kakoune-unwrapped.overrideAttrs (
    old: {
      src = sources.kakoune;
      preConfigure = ''
        export version="master"
      '';
      enableParallelBuilding = true;
    }
  );
  zig-git = unstable.zig.overrideAttrs (
    old: {
      src = super.pkgs.fetchFromGitHub {
        owner = "ziglang";
        repo = "zig";
        rev = "a282ac7a9119cd0961ea17e29c4a0e9b0baf60d0";
        sha256 = "0xyn705189g6w6zz9v92xsfq9kgqc5dxnycgsysa0sw05kjf78hx";
      };
    }
  );
}
