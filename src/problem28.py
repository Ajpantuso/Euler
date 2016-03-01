values = [1]
n = 2
while len(values) < 2001:
    last = values[-1]
    values = values + [last+n,last+2*n,last+3*n,last+4*n]
    n = n+2
print sum(values)
