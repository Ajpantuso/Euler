isPrime :: Integer -> Bool
isPrime n = all (\x -> n `mod` x /= 0) [2..m]
    where
        m = integerSqrt n

greatestPrime :: Integer -> Integer
greatestPrime n = maximum $ filter (\x -> n `mod` x == 0) $ filter isPrime [2..m]
    where
        m = integerSqrt n

integerSqrt :: Integer -> Integer
integerSqrt = floor . sqrt . fromIntegral
