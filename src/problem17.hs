import qualified Data.Map as Map

lib :: Map.Map [Int] Int
lib = Map.fromList ([([1,2,6,10]: 3), ([4,5,9]: 4), ([3,7,8,40,50,60]: 5)
                    ,([11,12,20,30,80,90]: 6),([15,16,70]: 7) 
                    ,([13,14,18,19]: 8), ([17]: 9)])

