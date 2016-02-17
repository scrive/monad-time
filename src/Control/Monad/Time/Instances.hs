{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# LANGUAGE CPP, FlexibleContexts, FlexibleInstances, UndecidableInstances #-}
#if __GLASGOW_HASKELL__ < 710
{-# LANGUAGE OverlappingInstances #-}
{-# OPTIONS_GHC -fno-warn-unrecognised-pragmas #-}
#endif

module Control.Monad.Time.Instances () where

import Control.Monad.Trans
import Control.Monad.Time

-- | Generic, overlappable instance.
-- Defined and exported only from 'Control.Monad.Time.Instances'.
instance {-# OVERLAPPABLE #-}
  ( MonadTime m
  , MonadTrans t
  , Monad (t m)
  ) => MonadTime (t m) where
    currentTime = lift currentTime
