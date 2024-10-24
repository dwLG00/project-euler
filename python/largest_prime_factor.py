import math

def find_prime_factor(n):
    if n == 2:
        return [2]
    for i in range(2, int(math.sqrt(n))):
        if n % i == 0:
            return find_prime_factor(i) + find_prime_factor(n // i)
    return [n]

if __name__ == '__main__':
    print(find_prime_factor(600851475143))
