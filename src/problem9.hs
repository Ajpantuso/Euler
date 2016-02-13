problem9 :: Integral a => (a,a,a)
problem9 = head [(a,b,c) | a<-ls,b<-ls,c<-ls,a^2 + b^2 == c^2,a+b+c==1000]
    where ls = [1..450]

answer = 
        let (a,b,c) = problem9
            in 
                a*b*c
