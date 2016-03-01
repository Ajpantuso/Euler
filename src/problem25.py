def fib(n):
    a,b = 1,1
    for i in range(n-1):
        a,b = b,a+b
    return a

def problem25():
    for i in range(10000):
        if len(str(fib(i))) == 1000:
            return i
    return -1

print(problem25())
