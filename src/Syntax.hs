{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE DeriveFoldable #-}
{-# LANGUAGE DeriveTraversable #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module Syntax (
    AnnExpr (..)
  , Expr (..)
  , ExprF (..)
  , PrimV (..)
  , Name (..)
  ) where


import           Data.Bool (Bool)
import           Data.Foldable (Foldable)
import           Data.Functor (Functor)
import           Data.Text (Text)
import           Data.Traversable (Traversable)

import           Prelude (Eq, Ord, Show)


-- | An annotated fixpoint of 'ExprF'.
newtype AnnExpr a = AnnExpr {
    unAnnExpr :: (a, ExprF (AnnExpr a))
  } deriving (Eq, Ord, Show, Functor, Foldable, Traversable)

-- | A fixpoint of 'ExprF'.
newtype Expr = Expr {
    unExpr :: ExprF Expr
  } deriving (Eq, Ord, Show)

-- | Syntax functor.
data ExprF a
  = PrimE PrimV
  | VarE Name
  | LamE Name a
  | AppE a a
  deriving (Eq, Ord, Show, Functor, Foldable, Traversable)

-- | Primitive values.
data PrimV
  = StringV Text
  | BooleV Bool
  deriving (Eq, Ord, Show)

-- | Variable names.
newtype Name = Name {
    unName :: Text
  } deriving (Eq, Ord, Show)
