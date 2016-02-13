def problem9():
    for a in range(2,450):
        for b in range(a,450):
            for c in range(450):
                if a**2 + b**2 == c**2 and a+b+c==1000:
                    return a*b*c

print(problem9())
