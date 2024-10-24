-- Sum of all numbers < 1000 that are multiples of 3 or 5

div3 :: Int -> Bool
div3 x = x `rem` 3 == 0
div5 :: Int -> Bool
div5 x = x `rem` 5 == 0

factor3or5 :: Int -> [Int]
factor3or5 0 = []
factor3or5 1 = []
factor3or5 x = [i | i <- [1..(x-1)], div3 i || div5 i]

main = do
    putStrLn (show (sum (factor3or5 1000)))
