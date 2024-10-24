-- Find the 10001st prime number

divides :: Int -> Int -> Bool
divides x y = x `rem` y == 0

isprime :: Int -> Bool
isprime x = isprimeAux x 2

isprimeAux :: Int -> Int -> Bool
isprimeAux x y = 
    if y ^ 2 > x then True
    else if divides x y then False
    else isprimeAux x (y + 1)

nextPrime :: Int -> Int
nextPrime n =
    if isprime (n + 1) then (n + 1)
    else nextPrime (n + 1)

nPrimes :: Int -> Int
nPrimes n = nPrimesAux n 1

nPrimesAux :: Int -> Int -> Int
nPrimesAux 0 p = p
nPrimesAux n p = nPrimesAux (n - 1) (nextPrime p)

main = do
    print (isprime 7)
    print (isprime 8)
    print (nPrimes 6)
    print (nPrimes 10001)
