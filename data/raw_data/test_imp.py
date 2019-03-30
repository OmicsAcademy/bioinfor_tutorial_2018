import sys
import os
import os.path
import re

print(sys.modules['os'])
#print(os.path.dirname(sys.__file__))


print(sys.argv)
#print(sys.__path__)
#from test_mean
sys.path.append(os.path.abspath(os.path.dirname(__file__)))
 
import mean_val as mean_value
#list3_num = [9, 8, 7] 
#print(mean_value(list3_num))
