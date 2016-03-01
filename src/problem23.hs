import qualified Data.Set as Set

isAbundant :: Int -> Bool
isAbundant n = n < (sum $ filter (\x -> n `mod` x == 0) [1..(n `div` 2)])

answer :: Int
answer = sum $ (Set.fromList [1..28123]) Set.\\ abundantsPlus 
    where
        abundants = filter isAbundant [12..28123]
        abundantsPlus = Set.fromList [x+y | x<-abundants,y<-abundants]

