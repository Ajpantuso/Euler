#BAD CODE
#SLOPPY
def decimal(n,d):
    digits = ""
    while n/d > 0 :
        n = (n % d)*10
    n = (n % d)*10
    for i in range(10000):
        digits = digits + str(n/d)
        n = (n % d)*10
    return repetitions(digits.lstrip("0"))

def repetitions(s):
    if s == "":
        return []
    if s.count(s[0]) < 2:
        return repetitions(s[1:])
    else:
        end = s.find(s[0],1)
    while end > 0:
        newEnd = end + len(s[0:end])
        if s[0:end] == s[end:newEnd]:
            return s[0:end]
        end = s.find(s[0],end+1)
    return []

def problem26():
    greatest = 0
    for d in range(2,1001):
        print (d, decimal(1,d))
        if len(decimal(1,d)) > greatest:
            greatest = len(decimal(1,d))
            answer = d
    return answer

print(problem26())
