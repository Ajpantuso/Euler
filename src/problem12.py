import math

def divisors(n):
    i = 1
    divList = []
    for i in range(1,int(math.sqrt(n))):
        if n % i == 0:
            divList.append(i)
            divList.append(n / i)
    return divList

def problem12():
    i = 1
    while(len(divisors(i*(i+1)/2)) < 500):
        i += 1
    return (i*(i+1)/2)

print(problem12())
