# File: generate_tests.py
import random

WIDTH = 8
TEST_COUNT = 20

print("Generated ALU Test Vectors:")
for _ in range(TEST_COUNT):
    a = random.randint(0, 2**WIDTH - 1)
    b = random.randint(0, 2**WIDTH - 1)
    op = random.randint(0, 5)
    dir = random.randint(0, 1)
    print(f"a={a}, b={b}, op={op}, dir={dir}")
