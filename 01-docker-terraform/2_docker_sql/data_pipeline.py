import sys
import pandas as pd

print(sys.argv)
day=sys.argv[1]

# Some fancy stuff to prove pandas
print(pd.__version__)
print(f"Hello world, Job finished successfully for day ={day}")