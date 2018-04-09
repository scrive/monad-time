{-# LANGUAGE CPP, FlexibleContexts, FlexibleInstances, UndecidableInstances #-}

#if __GLASGOW_HASKELL__ < 710
{-# LANGUAGE OverlappingInstances #-}
#endif

module Control.Monad.Time (MonadTime(..)) where

import Control.Monad.Trans
import Control.Monad.Reader (ReaderT, ask)
import Data.Time

-- | Class of monads which carry the notion of the current time.
class Monad m => MonadTime m where
  currentTime :: m UTCTime

-- | Base instance for IO.
instance MonadTime IO where
  currentTime = getCurrentTime

-- | This is @ReaderT UTCTime@ on purpose, to avoid breaking
-- downstream.
--
-- @since 0.3.0.0
instance {-# OVERLAPPING #-} Monad m => MonadTime (ReaderT UTCTime m) where
  currentTime = ask

-- | Generic, overlapping instance.
instance {-# OVERLAPPABLE #-} (
    MonadTime m
  , MonadTrans t
  , Monad (t m)
  ) => MonadTime (t m) where
    currentTime = lift currentTime
