{ stdenv, fetchFromGitHub, pkgconfig, libX11, ncurses, libXext, libXft, fontconfig }:

with stdenv.lib;

stdenv.mkDerivation {
  name = "st-mlvzk";
  src = fetchFromGitHub {
    owner = "mlvzk";
    repo = "st";
    rev = "a2972f5e74328990ced06e721aae3610d5f28cc2";
    sha256 = "0ykdsq96jbkmywwl9qpmk30kwbnsqcxhrvwgnw8fhz9wag44y2l2";
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
