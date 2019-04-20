{ stdenv, fetchgit, libX11, libXinerama, libXft }:

stdenv.mkDerivation {
  name = "dwm-mlvzk";

  src = fetchgit {
    url = "https://github.com/mlvzk/dwm.git";
    rev = "94387a4614b528e5014eabb48e8ac950b8fc4d2f";
    sha256 = "1c7dk5w6ws0q0jpsyws7mdz0qcjayvr0m4l3i2318shjcj567mnl";
  };

  buildInputs = [ libX11 libXinerama libXft ];

  buildPhase = "make";

  meta = with stdenv.lib; {
    homepage = https://suckless.org/;
    description = "Dynamic window manager for X, development version";
    license = licenses.mit;
    maintainers = [];
    platforms = platforms.unix;
  };
}

