#!/usr/bin/perl
$/="\n\n";
while(<>){$x+=(()=m/(ecl|pid|[ebi]yr|hcl|hgt):/g)==7}
die$x;
