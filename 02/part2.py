#!/usr/bin/python3
import re
import sys
a=sys.stdin.read().strip()
c=0
for l in a.split("\n"):
	b=re.search('^([0-9]+)-([0-9]+) (.): (.*)',l)
	password=b.group(4)
	if ( password[int(b.group(1))-1] == b.group(3) ) + \
	   ( password[int(b.group(2))-1] == b.group(3) ) == 1:
		c+=1
print(c)
