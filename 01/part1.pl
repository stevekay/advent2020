#!/usr/bin/perl
while(<>) {
 chomp;
 push @a,$_;
}
for $x (@a) {
 for $y (@a) {
  if($x + $y == 2020) {
   die("$x $y ",$x*$y)
  }
 }
}
