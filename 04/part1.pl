#!/usr/bin/perl
$/="\n\n";
while(<>) {
  $x++ if(()=m/(ecl|pid|[ebi]yr|hcl|hgt):/g)==7;
}
print "$x\n";
