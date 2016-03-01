def stripQuotes(str):
    return str.strip('"')

def nameScore(s,i):
    total = 0
    for c in s:
        total += ord(c) - 64
    return total * i

def problem22():
    f = open('../data/p22_names.txt', 'r')
    nameList = map(stripQuotes,f.read().split(","))
    nameList.sort()
    total = 0
    for i,name in enumerate(nameList):
        total += nameScore(name,i+1)
    return total

print(problem22())

