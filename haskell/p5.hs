-- Smallest Int that is divisible by all Ints 1-20

leastMultiple :: [Int] -> Int
leastMultiple xs = foldl lcm 1 xs


main = do
    putStrLn (show (leastMultiple [1..10]))
    putStrLn (show (leastMultiple [1..20]))
