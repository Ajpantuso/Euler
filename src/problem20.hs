import Data.List

factorial :: Integer -> Integer
factorial n = foldr (*) 1 [1..n]

sumDigits :: Integer -> Integer
sumDigits = sum . map read . words . intersperse (' ') . show 

answer = sumDigits $ factorial 100
