-- We've used map on lists a fair bit.
-- map ::(a -> b) -> [a] -> [b]
-- We've also seen several similar functions:
mapMaybe :: (a -> b) -> Maybe a -> Maybe b
mapMaybe _ Nothing = Nothing
mapMaybe f (Just a) = Just (f a)

second :: (a -> b) -> (c, a) -> (c, b)
second f (c, a) = (c, f a)

-- Now that you know about type classes, you might wonder if we can
-- express all of these as a type class.  The answer is yes, and Haskell
-- comes with the definitions built in.

-- class Functor f where
--   fmap :: (a -> b) -> f a -> f b

-- So we can write fmap instead of any of: map, mapMaybe, second.
-- Note that Haskell picks that fmap on pairs should be second, not first.

-- Note that fmap always lets us change the type from a to b,
-- So every Functor needs to be the same kind as Maybe, or list (ie, [])
-- We say Maybe is a Functor, not that Maybe Int is a Functor.
-- The reading explains this at much greater length.

-- Let's write a few more Functor instances

-- Write a Functor instance for Vec2.
data Vec2 n = Vec2 n n

instance Functor Vec2 where
	fmap f (Vec2 (a) (b))  = Vec2 (f a) (f b)  

-- We can build data structures more interesting than lists.
-- One choice is a binary tree.
-- This particular Tree can never be empty.  
-- A Tree a is either a Leaf with one a, or it branches into two sub-Trees.
data Tree a = Leaf a | Branch (Tree a) (Tree a) 

-- We can recurse on Trees much the way we do on lists.

-- Write a Functor instance for Tree.
instance Functor Tree where
	fmap f (Branch a s) = 
	fmap f (Leaf a) = 
main = return ()