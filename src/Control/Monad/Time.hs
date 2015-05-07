module Control.Monad.Time (MonadTime(..)) where

import Data.Time

-- | Class of monads which carry the notion of the current time.
class Monad m => MonadTime m where
  currentTime :: m UTCTime

instance MonadTime IO where
  currentTime = getCurrentTime
