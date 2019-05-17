{ stdenv, fetchgit, libX11, libXinerama, libXft }:

stdenv.mkDerivation {
  name = "dwm-mlvzk";

  src = fetchgit {
    url = "https://github.com/mlvzk/dwm.git";
    rev = "master";
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

