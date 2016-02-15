from math import factorial

def binomialCoefficient(n,k):
    return factorial(n)/(factorial(k)*factorial(n-k))

def problem11():
    return binomialCoefficient(40,20)

print(problem11())
