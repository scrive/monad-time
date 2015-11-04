{-# OPTIONS_GHC -fno-warn-orphans -fno-warn-deprecated-flags #-}
{-# LANGUAGE FlexibleContexts, FlexibleInstances, OverlappingInstances
  , UndecidableInstances #-}

module Control.Monad.Time.Instances () where

import Control.Monad.Trans
import Control.Monad.Time

-- | Generic, overlapping instance.
instance (
    MonadTime m
  , MonadTrans t
  , Monad (t m)
  ) => MonadTime (t m) where
    currentTime = lift currentTime
