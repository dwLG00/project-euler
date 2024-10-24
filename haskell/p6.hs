-- Sum of squares of sequence - square of sum of sequence

square = \ x -> x ^ 2

sumSquares :: [Int] -> Int
sumSquares xs = sum (map square xs)

squareSum :: [Int] -> Int
squareSum xs = (sum xs) ^ 2

sqDiff :: Int -> Int
sqDiff x = squareSum [1..x] - sumSquares [1..x]

main = do
    print (map square [1..100])
    print (sumSquares [1..100])
    print (squareSum [1..100])
    print (sqDiff 100)
