problem1 :: Integer -> Integer
problem1 n = sum . filter f $ [1..n]
    where
        f x = (x `mod` 5 == 0) || (x `mod` 3 == 0)
