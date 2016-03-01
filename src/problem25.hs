import Data.List 

fibonacci :: [Integer]
fibonacci = 1 : 1 : zipWith (+) fibonacci (tail fibonacci)

answer = case find (\(i,f) -> length (show f) == 1000) $ zip [1..] fibonacci of
            Just (i,f) -> i
            Nothing    -> -1
