def d(n):
    total = 0
    for i in range(1, (n // 2)+1):
        if n % i == 0:
            total += i
    return total

def problem21():
    total = 0
    for i in range(1, 10000):
        if d(i) < 10000 and i != d(i):
            if i == d(d(i)):
                total += i
    return total

print(problem21())
