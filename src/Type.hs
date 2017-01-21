{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE DeriveFoldable #-}
{-# LANGUAGE DeriveTraversable #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module Type (
    Type (..)
  , TypeF (..)
  , PrimT (..)
  ) where


import           Data.Foldable (Foldable)
import           Data.Functor (Functor)
import           Data.Traversable (Traversable)

import           Prelude (Eq, Ord, Show)


-- | A fixpoint of 'TypeF'.
newtype Type = Type {
    unType :: TypeF Type
  } deriving (Eq, Ord, Show)

-- | Type functor.
data TypeF a
  = PrimT PrimT
  | ArrowT a a
  deriving (Eq, Ord, Show, Functor, Foldable, Traversable)

-- | Primitive types.
data PrimT
  = StringT
  | BooleT
  deriving (Eq, Ord, Show)
