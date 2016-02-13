--In Hindsight I should have wrapped the matrix with a margin of
--3 zeroes to eliminate special testing for edge conditions i.e.
--0000000000
--0000000000
--0000000000
--000----000
--000----000 <- all test outside index range return 0
--000----000
--0000000000
--0000000000
--0000000000
import Data.Matrix

data Region = TL | TR | DL | DR | T | R | D | L | C
testMatrix :: Matrix Int
testMatrix = fromList 10 10 [1..100]

trueMatrix :: Matrix Int
trueMatrix = fromLists [ [ 8, 2, 22, 97, 38, 15, 0, 40, 0, 75, 4, 5, 7, 78, 52, 12, 50, 77, 91, 8 ],
                         [ 49, 49, 99, 40, 17, 81, 18, 57, 60, 87, 17, 40, 98, 43, 69, 48, 04, 56, 62, 00 ],
                         [ 81, 49, 31, 73, 55, 79, 14, 29, 93, 71, 40, 67, 53, 88, 30, 03, 49, 13, 36, 65 ],
                         [ 52, 70, 95, 23, 04, 60, 11, 42, 69, 24, 68, 56, 01, 32, 56, 71, 37, 02, 36, 91 ],
                         [ 22, 31, 16, 71, 51, 67, 63, 89, 41, 92, 36, 54, 22, 40, 40, 28, 66, 33, 13, 80 ],
                         [ 24, 47, 32, 60, 99, 03, 45, 02, 44, 75, 33, 53, 78, 36, 84, 20, 35, 17, 12, 50 ],
                         [ 32, 98, 81, 28, 64, 23, 67, 10, 26, 38, 40, 67, 59, 54, 70, 66, 18, 38, 64, 70 ],
                         [ 67, 26, 20, 68, 02, 62, 12, 20, 95, 63, 94, 39, 63, 8, 40, 91, 66, 49, 94, 21 ],
                         [ 24, 55, 58, 05, 66, 73, 99, 26, 97, 17, 78, 78, 96, 83, 14, 88, 34, 89, 63, 72 ],
                         [ 21, 36, 23, 9, 75, 00, 76, 44, 20, 45, 35, 14, 00, 61, 33, 97, 34, 31, 33, 95 ],
                         [ 78, 17, 53, 28, 22, 75, 31, 67, 15, 94, 03, 80, 04, 62, 16, 14, 9, 53, 56, 92 ],
                         [ 16, 39, 05, 42, 96, 35, 31, 47, 55, 58, 88, 24, 00, 17, 54, 24, 36, 29, 85, 57 ],
                         [ 86, 56, 00, 48, 35, 71, 89, 07, 05, 44, 44, 37, 44, 60, 21, 58, 51, 54, 17, 58 ],
                         [ 19, 80, 81, 68, 05, 94, 47, 69, 28, 73, 92, 13, 86, 52, 17, 77, 04, 89, 55, 40 ],
                         [ 04, 52, 8, 83, 97, 35, 99, 16, 07, 97, 57, 32, 16, 26, 26, 79, 33, 27, 98, 66 ],
                         [ 88, 36, 68, 87, 57, 62, 20, 72, 03, 46, 33, 67, 46, 55, 12, 32, 63, 93, 53, 69 ],
                         [ 04, 42, 16, 73, 38, 25, 39, 11, 24, 94, 72, 18, 8, 46, 29, 32, 40, 62, 76, 36 ],
                         [ 20, 69, 36, 41, 72, 30, 23, 88, 34, 62, 99, 69, 82, 67, 59, 85, 74, 04, 36, 16 ],
                         [ 20, 73, 35, 29, 78, 31, 90, 01, 74, 31, 49, 71, 48, 86, 81, 16, 23, 57, 05, 54 ],
                         [ 01, 70, 54, 71, 83, 51, 54, 69, 16, 92, 33, 48, 61, 43, 52, 01, 89, 19, 67, 48 ] ]

testCorner :: Int -> Int -> Matrix Int -> (Matrix Int, Region)
testCorner i j mtx
    | i < 4 =
        if j < 4
            then (submatrix i (i+3) j (j+3) mtx, TL)
            else if  j > (r-4)
                then (submatrix i (i+3) (j-3) j mtx, TR)
                else (submatrix i (i+3) (j-3) (j+3) mtx, T)
    | i > (r-4) =
        if j < 4
            then (submatrix (i-3) i j (j+3) mtx, DL)
            else if  j > (r-4)
                then (submatrix (i-3) i (j-3) j mtx, DR)
                else (submatrix (i-3) i (j-3) (j+3) mtx, D)
    | j < 4     = (submatrix (i-3) (i+3) j (j+3) mtx, L)
    | j > (c-4) = (submatrix (i-3) (i+3) (j-3) j mtx, R)
    | otherwise = (submatrix (i-3) (i+3) (j-3) (j+3) mtx, C)
        where
            r = nrows mtx
            c = ncols mtx

problem11 :: (Matrix Int, Region) -> [Int]
problem11 (m, r) = case r of
                        TL -> [checkDown 1 1 m,checkRight 1 1 m,
                               checkDR 1 1 m]
                        T  -> [checkDown 1 4 m,checkRight 1 4 m,
                               checkLeft 1 4 m,checkDR 1 4 m,
                               checkDL 1 4 m]
                        TR -> [checkLeft 1 4 m,checkDown 1 4 m,
                               checkDL 1 4 m]
                        R  -> [checkUp 4 4 m,checkDown 4 4 m,
                               checkLeft 4 4 m,checkUL 4 4 m,
                               checkDL 4 4 m]
                        DR -> [checkLeft 4 4 m,checkUp 4 4 m,
                               checkUL 4 4 m]
                        D  -> [checkUp 4 4 m,checkRight 4 4 m,
                               checkLeft 4 4 m,checkUL 4 4 m,
                               checkUR 4 4 m]
                        DL -> [checkUp 4 1 m,checkRight 4 1 m,
                               checkUR 4 1 m]
                        L  -> [checkUp 4 1 m,checkDown 4 1 m,
                               checkRight 4 1 m,checkUR 4 1 m,
                               checkDR 4 1 m]
                        C  -> [checkUp 4 4 m,checkDown 4 4 m,
                               checkRight 4 4 m,checkLeft 4 4 m,
                               checkUR 4 4 m,checkUL 4 4 m,
                               checkDR 4 4 m,checkDL 4 4 m]

answer :: Matrix Int -> Int
answer mtx = maximum $ concat $ map problem11 [ testCorner i j mtx | i<-[1..(nrows mtx)],j<-[1..(ncols mtx)]]

prod :: [Int] -> [Int] -> Matrix Int -> Int
prod is js mtx = product [mtx ! (i,j) | i<-is,j<-js]

diagProduct :: [Int] -> [Int] -> Matrix Int -> Int
diagProduct is js mtx = product $ map (mtx !) $ zip is js

checkLeft :: Int -> Int -> Matrix Int -> Int
checkLeft i j = prod [i] [j-3..j]

checkRight :: Int -> Int -> Matrix Int -> Int
checkRight i j = prod [i] [j..j+3]

checkUp :: Int -> Int -> Matrix Int -> Int
checkUp i j = prod [i-3..i] [j]

checkDown :: Int -> Int -> Matrix Int -> Int
checkDown i j = prod [i..i+3] [j]

checkUR :: Int -> Int -> Matrix Int -> Int
checkUR i j = diagProduct [i,i-1,i-2,i-3] [j..j+3]

checkUL :: Int -> Int -> Matrix Int -> Int
checkUL i j = diagProduct [i-3..i] [j-3..j]

checkDL :: Int -> Int -> Matrix Int -> Int
checkDL i j = diagProduct [i+3,i+2,i+1,i] [j-3..j]

checkDR :: Int -> Int -> Matrix Int -> Int
checkDR i j = diagProduct [i..i+3] [j..j+3]
