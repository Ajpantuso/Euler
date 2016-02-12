x1 = 1
x2 = 1
total = 0
while (x1 + x2) < 4000000:
    temp = x1
    x1 = x2
    x2 = x2 + temp
    if x2 % 2 == 0:
        total += x2
print (total)
