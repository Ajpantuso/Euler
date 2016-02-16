def isLeapYear(year):
    if year % 100 == 0:
        if year % 400 == 0:
            return True
        else:
            return False
    else:
        return year % 4 == 0

def mod7(x):
    return x % 7

dow={"M": 0,"T": 1,"W": 2,"TR": 3,"F": 4,"S": 5,"SU": 6}

def problem19(firstDay,firstYear,lastYear):
    x = dow[firstDay]
    total = 0
    for year in range(firstYear,lastYear+1):
        if isLeapYear(year):
            total += map(mod7, [x,x+3,x+4,x+7,x+9,x+12,x+14
                               ,x+17,x+20,x+22,x+25,x+27]).count(6)
            x = (x + 30) % 7
        else:
            total += map(mod7, [x,x+3,x+3,x+6,x+8,x+11,x+13
                               ,x+16,x+19,x+21,x+24,x+26]).count(6)
            x = (x + 29) % 7
    return total

print(problem19("T",1901,2000))
