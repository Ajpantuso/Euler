def sumOfPrimes(n):
    primes = [2]
    for i in range(3,n):
        flag = True
        j = 2
        while j*j <= i:
            if i % j == 0:
                flag = False
                break
            j += 1
        if flag:
            primes.append(i)
            i += 1
    return sum(primes)

print(sumOfPrimes(2000000))
