#!/usr/bin/perl
while(<>) {
 chomp;
 push @a,$_;
}
for $x (@a) {
 for $y (@a) {
  for $z (@a) {
   if($x + $y + $z == 2020) {
    die($x * $y * $z)
   }
  }
 }
}
