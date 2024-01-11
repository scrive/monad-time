module Control.Monad.Time.Utils
  ( timed
  ) where

import Control.Monad.Time

-- | Measure how much time a monadic action takes.
timed :: MonadTime m => m r -> m (r, Double)
timed mr = do
  t1 <- monotonicTime
  r <- mr
  t2 <- monotonicTime
  r `seq` pure (r, t2 - t1)
