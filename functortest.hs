data List a = Nil | Cons a (List a) deriving Show

instance Functor List where
  fmap _ Nil = Nil
  fmap f (Cons x (xs)) = Cons (f x)(fmap f xs) 