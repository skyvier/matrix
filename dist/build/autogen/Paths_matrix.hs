module Paths_matrix (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,3,4,5] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/skyvier/.cabal/bin"
libdir     = "/home/skyvier/.cabal/lib/x86_64-linux-ghc-7.10.3/matrix-0.3.4.5-LLK5pCfBUVf6tOkgmlzo6E"
datadir    = "/home/skyvier/.cabal/share/x86_64-linux-ghc-7.10.3/matrix-0.3.4.5"
libexecdir = "/home/skyvier/.cabal/libexec"
sysconfdir = "/home/skyvier/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "matrix_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "matrix_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "matrix_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "matrix_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "matrix_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
