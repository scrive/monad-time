module Main (main) where

import Control.Monad.Reader
import Control.Monad.State

import Control.Monad.Time
import Control.Monad.Time.Instances ()

main :: IO ()
main = do
  currentTime >>= print
  -- Test that generic MonadTrans instance works.
  runReaderT currentTime 'x' >>= print
  evalStateT (runReaderT currentTime 'x') 'y' >>= print
