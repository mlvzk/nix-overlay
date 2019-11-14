{ stdenv, fetchFromGitHub, libX11, libXinerama, libXft }:

stdenv.mkDerivation {
  name = "dwm-mlvzk";

  src = fetchFromGitHub {
    owner = "mlvzk";
    repo = "dwm";
    rev = "60c066e5df19369090d11d59f04ce8e90505798d";
    sha256 = "0fsa56kwdj2p8zmzksi3kh4bm3xf9ncv66bc4hq1kw399pqgwxiz";
  };


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

