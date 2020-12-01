#!/usr/bin/python3
import sys
a = sys.stdin.read().strip()

#a = [int(x) for x in input()]
#a = sys.stdin.read().split("\n")
for x in a.split("\n"):
	for y in a.split("\n"):
  		if( int(x)+int(y) == 2020):
  			print(int(x)*int(y))
  			exit()
