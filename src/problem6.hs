answer = squareOfSum - sumOfSquares
    where sumOfSquares = sum $ map (^ 2) [1..100]
          squareOfSum  = (^ 2) $ sum [1..100]

