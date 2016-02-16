from math import factorial

def sumDigits(n):
    total = 0
    for c in str(n):
        total += int(c)
    return total

print(sumDigits(factorial(100)))
