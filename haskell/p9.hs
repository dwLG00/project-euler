-- Find a Pythagorean triplet a + b + c = 1000, a < b < c, such that a^2 + b^2 = c^2.

-- Given b, gets all triplets (a, b, c) such that a < b < c and a + b + c == 1000
-- c > b => 1000 - b - a > b => 1000 - 2b > a
findTriplets :: Int -> [(Int, Int, Int)]
findTriplets b = [(a, b, c) | a <- [1..(min (1000 - 2*b - 1) (b - 1))], let c = (1000 - b) - a]

isPythagorean :: (Int, Int, Int) -> Maybe (Int, Int, Int)
isPythagorean (a, b, c) = if (a^2 + b^2 == c^2) then (Just (a, b, c)) else Nothing

catchFirst :: Maybe a -> Maybe a -> Maybe a
catchFirst Nothing Nothing = Nothing
catchFirst (Just x) Nothing = Just x
catchFirst Nothing (Just y) = Just y
catchFirst (Just x) (Just y) = Just x

findPythagorean :: Int -> Maybe (Int, Int, Int)
findPythagorean b = foldl catchFirst Nothing (map isPythagorean (findTriplets b))

main = do
    let bs = [3..4999]
    let triple = foldl catchFirst Nothing (map findPythagorean bs)
    let s = case triple of {
        Just (a, b, c) -> a * b * c;
        Nothing -> 0
    }
    print s
