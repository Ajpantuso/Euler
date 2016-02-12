isPrime :: Integer -> Bool
isPrime n = all (\x -> n `mod` x /= 0) [2..m]
    where
        m = integerSqrt n

naturals2 :: [Integer]
naturals2 = iterate (+1) 2

integerSqrt :: Integer -> Integer
integerSqrt = floor . sqrt . fromIntegral

problem7 :: Int -> Integer
problem7 n = last . take n $ filter isPrime $ naturals2

answer = problem7 10001
