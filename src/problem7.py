def nthprime(n):
    primes = [2]
    i = 3
    while (len(primes) < n):
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
    return primes

print(nthprime(10001))
