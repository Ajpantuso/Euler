def isAbundant(n):
    total = 0
    for i in range(1,(n//2)+1):
        if n % i == 0:
            total += i
    if total > n:
        return True
    return False

def problem23():
    abundants = []
    for i in range(12,28124):
        if isAbundant(i):
            abundants.append(i)
    abundantSums = [i+j for i in abundants for j in abundants]
    values = range(1,28124)
    return sum(list(set(values) - set(abundantSums)))

print(problem23())
