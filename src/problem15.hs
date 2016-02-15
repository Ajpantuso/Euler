--Very inefficient, but more fun than using
--binomial Coefficient
type Point = (Int,Int) 

data GridTree = Node Point GridTree GridTree | Empty | End deriving (Show)

move :: GridTree -> GridTree
move End   = End
move Empty = Empty
move (Node p@(x,y) _ _) 
    | x > 20 || y > 20 = Empty 
    | x == 20 && y == 20 = End
    | otherwise = (Node p down right)
        where down  = move $ Node (x,y+1) Empty Empty
              right = move $ Node (x+1,y) Empty Empty
                
countSuccess :: GridTree -> [GridTree]
countSuccess (Node _ d r) = (countSuccess d) ++ countSuccess r
countSuccess End          = [End]
countSuccess Empty        = []

answer = length $ countSuccess $ move (Node (0,0) Empty Empty)
