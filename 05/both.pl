#!/usr/bin/perl
while(<>) {
 $hi=127;
 $row=0;
 foreach $c (split(//,substr($_,0,7))) {
  if($c eq 'F') {
   $hi=($hi-1-$row)/2+$row;
   next;
  }
  $row=($hi+1-$row)/2+$row;
 }

 $hi=7;
 $col=0;
 foreach $c (split(//,substr($_,7,3))) {
  if($c eq 'L') {
   $hi=($hi-1-$col)/2+$col;
   next;
  }
  $col=($hi+1-$col)/2+$col;
 }

 $id=$row*8+$col;
 if($id > $max) { $max=$id }
 $a[$id]='x';
}
print "highest=$max\n";
for $b ( 1 .. ($#a)-1 ) {
 if($a[$b] ne 'x' && $a[$b-1] eq 'x' && $a[$b+1] eq 'x') {
  print "your seat=$b\n" 
 }
}
