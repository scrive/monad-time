{-# LANGUAGE UndecidableInstances #-}
module Control.Monad.Time
  ( MonadTime(..)
  ) where

import Control.Monad.Trans
import Data.Time
import GHC.Clock (getMonotonicTime)

-- | Class of monads which make it possible to measure time.
class Monad m => MonadTime m where
  currentTime :: m UTCTime
  monotonicTime :: m Double

-- | Base instance for IO.
instance MonadTime IO where
  currentTime = getCurrentTime
  monotonicTime = getMonotonicTime

-- | Generic, overlapping instance.
instance {-# OVERLAPPABLE #-}
  ( MonadTime m
  , MonadTrans t
  , Monad (t m)
  ) => MonadTime (t m) where
    currentTime = lift currentTime
    monotonicTime = lift monotonicTime
