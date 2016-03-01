import Data.Char (ord)
import Data.List

main = do
    contents <- readFile "../data/p22_names.txt"
    putStrLn $ show $ answer contents

answer :: String -> Int
answer xs = sum $ map nameSum $ zip [1..length xs] $ sort $ read $ "[" ++ xs ++ "]"

nameSum :: (Int,String) -> Int
nameSum (i,str) = i * (sum $ map (64 `subtract`) $ map ord str)
