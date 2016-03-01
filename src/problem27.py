import math

def isPrime(n):
    for i in range(2,int(math.sqrt(math.fabs(n)))):
        if n % i == 0:
            return False
    return True

gsf = 0
msf = 0
for a in range(-999,1000):
    for b in range(-999,1000):
        i = 0
        for n in range(1000):
            if not isPrime(n**2+a*n+b):
                break
            else:
                i += 1
        if i > gsf:
            gsf = i
            msf = a*b
print(msf)
