#!/usr/bin/python3
import re
import sys
a=sys.stdin.read().strip()
c=0
for l in a.split("\n"):
	b=re.search('^([0-9]+)-([0-9]+) (.): (.*)',l)
	password=b.group(4)
	count=password.count(b.group(3))
	if(count >= int(b.group(1)) and count <= int(b.group(2))):
		c+=1
print(c)
