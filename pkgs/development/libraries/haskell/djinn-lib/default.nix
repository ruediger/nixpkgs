# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, mtl }:

cabal.mkDerivation (self: {
  pname = "djinn-lib";
  version = "0.0.1.2";
  sha256 = "048hs27awl4j9lg04qbnpf8c51mzbgy2afckis19zcswmavi1zn0";
  buildDepends = [ mtl ];
  meta = {
    homepage = "http://www.augustsson.net/Darcs/Djinn/";
    description = "Generate Haskell code from a type. Library extracted from djinn package.";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
    maintainers = with self.stdenv.lib.maintainers; [ fuuzetsu ];
  };
})
