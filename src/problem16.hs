import Data.List

answer = sum $ map read $ words $ intersperse ' ' $ show $ 2^1000
