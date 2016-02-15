import Data.List

collatz :: Int -> [Int]
collatz n 
    | n == 1 = [1]
    | even n = n:collatz(n `div` 2)
    | odd n  = n:collatz(3*n + 1)
    | otherwise = []

answer :: (Int,Int)
answer = maximum $ (\x y -> zip y x) [1..999999] $ map length $ map collatz [1..999999]
