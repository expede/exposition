{-# LANGUAGE NoImplicitPrelude #-}
module Overture ( module ClassyPrelude
                , module Flow
                , ($>)
                , (<$)
                , (*>)
                , (<*)
                )

import ClassyPrelude
import Flow

-- "fLow-ER" ;)
($>) :: f a -> (a -> b) -> f b
($>) = flip fmap

(<$) :: (a -> b) -> f a -> f b
(<$) = fmap

-- strict fmap
($!>) :: f a -> (a -> b) -> f b
($!>) = undefined

(<!$) :: (a -> b) -> f a -> f b
(<!$) = undefined

(*>) :: f a -> f (a -> b) -> f b
(*>) = flip apply

(<*) :: f (a -> b) -> f a -> f b
(<*) = apply

(*>>) :: Applicative f =>  f a -> (a -> b) -> f b
(*>>) = flip liftA

(<<*) :: Applicative f => (a -> b) -> f a -> f b
(<<*) = liftA

(<$*) :: Applicative f => (a -> b -> c) -> f a -> f b -> f c
(<$*) = liftA2
f <$* a b = f <$ a <* b

-- (*$>)
-- (*$!>)
-- (<!$*)

-- strict liftA2
(<!$*) :: Applicative f => (a -> b -> c) -> f a -> f b -> f c
(<!$*) = undefined

(<!$*) :: Applicative f => (a -> b -> c) -> f a -> f b -> f c
(<!$*) = undefined

-- infix level and direction
(<$**) :: Applicative f => (a -> b -> c -> d) -> f a -> f b -> f c -> f d
(<$**) = liftA3

(**$>) :: Applicative f => f a -> f b -> f c -> f d -> (a -> b -> c -> d)
a **$> b c d f = a *> b *> c * d $> f

-- strict liftA3
(<!$**) :: Applicative f => (a -> b -> c -> d) -> f a -> f b -> f c -> f d
f <!$** a b c d = f <!$ a <* b <* c <* d

(**$!>) :: Applicative f => f a -> f b -> f c -> f d -> (a -> b -> c -> d)
a **$> b c d f = a *> b *> c * d $!> f
