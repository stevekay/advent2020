#!/usr/bin/perl
while(<>) {
 /^(\d+)-(\d+) (.): ([a-z]+)/;
 if((substr($4,$1-1,1) eq $3)+(substr($4,$2-1,1) eq $3)==1){$c++}
}
print "$c\n";
