import math

#If greatestPrime returns 0 then n must be prime

def isPrime(n):
    for i in range(2,int(math.sqrt(n))):
        if n % i == 0:
            return False
    return True

def greatestPrime(n):
    largestSoFar = 0
    for i in range(2,int(math.sqrt(n))):
        if n % i == 0 and isPrime(i):
            largestSoFar = i
    return largestSoFar

print(greatestPrime(600851475143))

