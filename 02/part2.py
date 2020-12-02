#!/usr/bin/python3
import re
import sys
a=sys.stdin.read().strip()
c=0
for l in a.split("\n"):
	b=re.search('^([0-9]+)-([0-9]+) (.): (.*)',l)
	posa=int(b.group(1))
	posb=int(b.group(2))
	char=b.group(3)
	password=b.group(4)
	if ( password[posa-1] == char ) + ( password[posb-1] == char ) == 1:
		c+=1
print(c)
