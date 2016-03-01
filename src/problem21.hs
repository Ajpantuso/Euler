d :: Int -> Int
d n = sum $ filter (\x -> n `mod` x == 0) [1..(n `div` 2)]

answer :: Int
answer = sum $ filter p [1..10000]
    where
        p n =  m < 10000 && n /= m && i == d m 
        m = d n
