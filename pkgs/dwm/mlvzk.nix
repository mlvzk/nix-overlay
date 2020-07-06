{ stdenv, fetchFromGitHub, libX11, libXinerama, libXft }:

stdenv.mkDerivation {
  name = "dwm-mlvzk";

  src = ./dwm;
  # src = fetchFromGitHub {
  #   owner = "mlvzk";
  #   repo = "dwm";
  #   rev = "07040d383c42f75b534963a20258af9899af2ef5";
  #   sha256 = "139zij9ljj5nx4db2sphw6yb0jg5m0hv9gj9p38z5riigpilnbz3";
  # };


  buildInputs = [ libX11 libXinerama libXft ];

  prePatch = ''sed -i "s@/usr/local@$out@" config.mk'';

  buildPhase = "make";

  meta = with stdenv.lib; {
    homepage = https://suckless.org/;
    description = "Dynamic window manager for X, development version";
    license = licenses.mit;
    maintainers = [];
    platforms = platforms.unix;
  };
}

