-- Find the 10001st prime number

divides :: Int -> Int -> Bool
divides x y = x `rem` y == 0

isPrime :: Int -> Bool
isPrime x = f x 2
    where f x y = if y^2 > x then True
                  else if divides x y then False
                  else f x (y + 1)

nextPrime :: Int -> Int
nextPrime n =
    if isPrime (n + 1) then (n + 1)
    else nextPrime (n + 1)

primesBelow :: Int -> [Int]
primesBelow n = f [] 2
    where f acc nextprime = if (n < nextprime) then acc else f (nextprime : acc) (nextPrime nextprime)

sumPrimesBelow :: Int -> Int
sumPrimesBelow n = sum (primesBelow n)

main = do
    print (primesBelow 10)
    print (sumPrimesBelow 2000000)
