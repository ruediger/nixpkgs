{ stdenv, fetchurl, m4, perl, gfortran, texLive, ffmpeg, tk
, imagemagick, liblapack
}:

stdenv.mkDerivation rec {
  name = "sage-6.3";

  src = fetchurl {
    url = "http://mirrors.xmission.com/sage/src/sage-6.3.tar.gz";
    sha256 = "bd317407271a7c8b94c1ff65b48b36ef9265685033005d5f748cc0c348e75033";
  };

  buildInputs = [ m4 perl gfortran texLive ffmpeg tk imagemagick liblapack ];

  enableParallelBuilding = true;

  preConfigure = ''
    export SAGE_NUM_THREADS=$NIX_BUILD_CORES
    sed -i 's/if ! [ -d "$HOME" ]/if [ -d "$HOME" ]/' src/bin/sage-env
  '' + stdenv.lib.optionalString stdenv.isDarwin ''
    sed -i "s/ld_version = try_run('ld  -v')/ld_version = 'Apple'/" \
      build/pkgs/atlas/configuration.py
  '';

  meta = {
    homepage = http://www.sagemath.org/;
    description = "A mathematical software with features covering many aspects of mathematics, including algebra, combinatorics, numerical mathematics, number theory, and calculus";
    license = stdenv.lib.licenses.gpl3;
  };
}
