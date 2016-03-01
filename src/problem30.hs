toDigitsRev :: Integer -> [Integer]
toDigitsRev 0 = []
toDigitsRev n = (n `mod` 10):toDigitsRev (n `div` 10)

toDigits :: Integer -> [Integer]
toDigits = reverse . toDigitsRev

sumFifths :: [Integer] -> Integer
sumFifths = sum . map (^ 5)

answer = [x | x <- [2..], x == sumFifths (toDigits x)]
        
