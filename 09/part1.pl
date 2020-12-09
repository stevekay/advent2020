#!/usr/bin/perl
($inp,$size)=@ARGV;
print "inp=$inp size=$size\n";
open(A,"<",$inp);
while(<A>) {
 chomp;
 print "got line $_\n";
 push @x,$_;
}
for $a ( $size .. $#x ) {
 printf "%03d = %d\n",$a,$x[$a];
 # total the previous 5 numbers
 $found=0;
 for $b ( ($a - $size) .. $a - 1) {
  for $c ( ($a - $size) .. $a - 1) {
#   printf " -> %03d + %03d = %d\n",$x[$b],$x[$c],$x[$b]+$x[$c];
   if( $x[$b]+$x[$c] == $x[$a]) {
    $found=1;
   }
  }
 }
 if($found == 0) {
  die "no match for $x[$a]";
 }
# print "x"
}
