def sumOfSquares(n):
    total = 0
    for i in range(1,n+1):
        total += i*i
    return total

def squareOfSum(n):
    total = sum(range(1,n+1))
    return total*total

def problem6(n):
    return squareOfSum(n) - sumOfSquares(n)

print (problem6(100))
