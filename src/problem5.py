#return dictionary of prime factors with
#number of times they occur
def primeFactors(n):
    i = 2
    factors = dict()
    while i * i <= n:
        if n % i:
            i += 1
        else:
            n //= i
            if i in factors:
                factors[i] += 1
            else:
                factors[i] = 1
    if n > 1:
        if n in factors:
            factors[n] += 1
        else:
            factors[n] = 1
    return factors
#find factor with most occurences or
#if number of occurences equal then
#highest value
def countFactors(ps):
    count = 1
    greatest = 1
    for k in ps:
        if ps[k] >= count and k > greatest:
            count = ps[k]
            greatest = k
    return (greatest, count)
#pick lcm factors such that for any
#factor f only the highest number of
#occurences of f in any number in range
#is included.Then factors are exponentiated
#by the number of occurences and multiplied
def problem5():
    lcmFactors = dict()
    for i in range(1,21):
        k, v = countFactors(primeFactors(i))
        if k in lcmFactors:
            lcmFactors[k] = max(lcmFactors[k],v)
        else:
            lcmFactors[k] = v
    result = 1
    for p in lcmFactors:
        print(str(p) + " " + str(lcmFactors[p]))
        result *= p**lcmFactors[p]
        print (result)
    return result

print(problem5())
