def isPalindrome(s):
    for i, c in enumerate(s):
            if c != s[-(i+1)]:
                return False
            if i > len(s)/2:
                return True

palindromes = []
for i in range(1000,100,-1):
    for j in range(1000,100,-1):
        if isPalindrome(str(i*j)):
             palindromes.append(i*j)
print (max(palindromes))
