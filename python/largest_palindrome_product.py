def largest_palindrome_product():
    maximum = 0
    for i in range(100, 1000):
        for j in range(100, 1000):
            prod = i * j
            if str(prod) == str(prod)[::-1]:
                maximum = max(maximum, prod)
    return maximum

if __name__ == '__main__':
    print(largest_palindrome_product())
