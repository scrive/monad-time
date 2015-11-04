module Main (main) where

import Control.Monad.Time
import Control.Monad.Time.Instances ()

import Control.Monad.Reader (runReaderT)
import Control.Monad.State (evalStateT)

main :: IO ()
main = do
    currentTime >>= print
    -- Test that generic MonadTrans instance works
    runReaderT currentTime 'x' >>= print
    evalStateT (runReaderT currentTime 'x') 'y' >>= print
