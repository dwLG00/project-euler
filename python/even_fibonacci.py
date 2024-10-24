
def fib():
    n1 = 0
    n2 = 1
    counter = 0
    while n2 < 4000000:
        if n2 % 2 == 0:
            counter += n2
        a = n2
        n2 += n1
        n1 = a

    return counter
