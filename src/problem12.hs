import Data.List

divisors :: Int -> [Int]
divisors n = (1 : filter ((==0) . rem n) [2..integerSqrt n]) ++ [n]

triangleNumber :: Int -> Int
triangleNumber n = n*(n+1) `div` 2

naturals :: [Int]
naturals = iterate (+1) 1

answer :: Maybe Int
answer = find (\x->(length (divisors x)*2) >= 500) $ map triangleNumber naturals

integerSqrt :: Int -> Int
integerSqrt = floor . sqrt . fromIntegral
