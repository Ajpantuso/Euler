problem2 :: Integer
problem2 = sum . filter even . filter (< 4000000) $ fib

fibonacci :: Num a => [Integer]
fibonacci = 1:2:zipWith (+) fibonacci (tail fibonacci)

