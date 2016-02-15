lib = {(1,2,6,10): 3, (4,5,9): 4, (3,7,8,40,50,60): 5, (11,12,20,30,80,90): 6,
       (15,16,70): 7, (13,14,18,19): 8, (17,17): 9}

def wordLength(n):
    if n == 0:
        return 0
    if n <= 20:
        for k in lib:
            if n in k:
                return lib[k]
                break
    elif n < 100:
        tens = (n // 10)*10
        for k in lib:
            if tens in k:
                return lib[k] + wordLength(n % 10)
                break
    elif n < 1000:
        hundreds = (n // 100)
        for k in lib:
            if hundreds in k:
                if n % 100 == 0:
                    return lib[k] + 7 #"hundred"
                    break
                else:
                    return lib[k] + wordLength(n % 100) + 10 #"hundred and"
                    break
    elif n == 1000:
        return len("onethousand")

def problem17():
    total = 0
    for i in range(1,1001):
        total += wordLength(i)
    return total

print(problem17())
