isPalindrome :: String -> Bool
isPalindrome str = str == reverse str

threeDigitPalindromes :: [Integer]
threeDigitPalindromes = [x*y | x <- tdn,y <- tdn,isPalindrome $ show $ x*y]
    where
        tdn = [100..1000]

greatestTDPD :: Integer
greatestTDPD = maximum threeDigitPalindromes
