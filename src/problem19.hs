--Instead of stepping through every day, the program
--takes advantages of the cycles that occur yearly

type Year = Int

isLeapYear :: Year -> Bool
isLeapYear year
    | year `mod` 400 == 0 = True
    | year `mod` 100 == 0 = False
    | year `mod` 4   == 0 = True
    | otherwise           = False

firstSundays :: Int -> Year -> Year -> Int
firstSundays day start end 
    | start > end = 0
    | isLeapYear start = leapNum + firstSundays ((day + 30) `mod` 7) (start+1) end
    | otherwise        = normNum + firstSundays ((day + 29) `mod` 7) (start+1) end
        where
            leapNum = length $ filter (== 6) $ map (`mod` 7) [day,day+3,day+4,day+7,day+9,day+12,day+14,day+17,day+20,day+22,day+25,day+27]
            normNum = length $ filter (== 6) $ map (`mod` 7) [day,day+3,day+3,day+6,day+8,day+11,day+13,day+16,day+19,day+21,day+24,day+26]

answer = firstSundays 1 1901 2000
