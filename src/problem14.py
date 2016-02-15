def collatz(n):
    seq = [n]
    while n != 1:
        if n % 2 == 0:
            n = n/2
        else:
            n = 3*n + 1
        seq.append(n)
    return seq

def problem13():
    greatest = 0
    candidate = 0
    for i in range(1,1000000):
        temp = len(collatz(i))
        if temp > greatest:
            greatest = temp
            candidate = i
    return (candidate,greatest)

print(problem13())
