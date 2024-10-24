-- Find the 13 adjacent digits in the series that have the greatest product

import System.IO
import Control.Monad

charsToNumbers :: String -> [Int]
charsToNumbers chars = [read [c] | c <- chars, c /= '\n']

maxWindow :: [Int] -> Int -> Int
maxWindow numbers windowsize =
    let firstn = take windowsize numbers in
    let remainder = drop windowsize numbers in
    let currentwindow = product firstn in
    maxWindowAux remainder firstn currentwindow currentwindow

-- maxWindowAux next previous max current
maxWindowAux :: [Int] -> [Int] -> Int -> Int -> Int
maxWindowAux [] _ max _ = max
maxWindowAux next previous max current =
    let afterwindow = head next in
    let beforewindow = head previous in
    let next_current = (afterwindow * current) `div` beforewindow in
    let next_max = if (max > next_current) then max else next_current in
    maxWindowAux (drop 1 next) ((drop 1 previous) ++ [afterwindow]) next_max next_current

splitWhen :: (a -> Bool) -> [a] -> [[a]]
splitWhen p xs = f xs []
    where f [] agg = [agg]
          f (y : ys) agg = if p y
                           then agg : f ys []
                           else f ys (agg ++ [y])

maxWindowEntire :: [Int] -> Int -> Int
maxWindowEntire numbers windowsize =
    let partitions = splitWhen (\ x -> x == 0) numbers in f partitions 0
        where f [] maxi = maxi
              f (numbers : othernumbers) maxi = if (length numbers < windowsize)
                                               then f othernumbers maxi
                                               else f othernumbers (max (maxWindow numbers windowsize) maxi)

main = do
    characters <- readFile "p8-numbers.txt"
    let numbers = charsToNumbers characters
    print numbers
    let partitions = (splitWhen (\ x -> x == 0) numbers)
    let maxOnPartitions = map (\ nums -> if (length nums < 4) then 0 else maxWindow nums 4) partitions
    print (maxWindowEntire numbers 13)
    --print (maxWindowEntire [1, 2, 3, 4, 5, 6] 4)
