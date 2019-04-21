{ stdenv, fetchFromGitHub, pkgconfig, libX11, ncurses, libXext, libXft, fontconfig }:

with stdenv.lib;

stdenv.mkDerivation {
  name = "st-mlvzk";
  src = fetchFromGitHub {
    owner = "mlvzk";
    repo = "st";
    rev = "613ca300d0ea3e67fded71110cb0253232e2e210";
    sha256 = "1115l1pczx50dx7hg90qxyy2pdhyahybyi7hvnxnkh3y0bsnp7fn";
  };

  nativeBuildInputs = [ pkgconfig ];
  buildInputs = [ libX11 ncurses libXext libXft fontconfig ];

  installPhase = ''
    TERMINFO=$out/share/terminfo make install PREFIX=$out
  '';

  meta = {
    homepage = https://github.com/neeasade/xst;
    description = "Simple terminal fork that can load config from Xresources";
    license = licenses.mit;
    maintainers = [  ];
    platforms = platforms.linux;
  };
}
