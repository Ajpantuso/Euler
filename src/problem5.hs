--Folding is Fun
problem5 :: Integral a => [a] -> a
problem5 xs = foldr lcm 1 xs

answer = problem5 [1..20]
