#!/usr/bin/perl
@a=();
$max=-1;
while(<>) {
 #print "got line $_";
 $hi=127;
 $lo=0;
 foreach $c (split(//,substr($_,0,7))) {
 # print "char $c\n";
  if($c eq 'F') {
   $hi=($hi-1-$lo)/2+$lo;
  } 
  if($c eq 'B') {
   $lo=($hi+1-$lo)/2+$lo;
  }
 # print "lo=$lo hi=$hi\n";
 }
 $row=$lo;
 #print "   seat is in row $row\n";

 $hi=7;
 $lo=0;
 foreach $c (split(//,substr($_,7,3))) {
 # print "seat lr $c\n";
  if($c eq 'L') {
   $hi=($hi-1-$lo)/2+$lo;
  }
  if($c eq 'R') {
    $lo=($hi+1-$lo)/2+$lo;
  }
 # print "lo=$lo hi=$hi\n";
 }
 #print "got $lo\n";
 $column=$lo;

 $id=$row*8+$column;

 #print "$_: row ",$row,", column ",$column," seat ID ",$id,"\n";
 if($id > $max) { $max=$id }
 $a[$id]='x';

 
 #print "--------\n";
  
 
}
print "highest=$max\n";
for $b ( 1 .. ($#a)-1 ) {
 if($a[$b] ne 'x' && $a[$b-1] eq 'x' && $a[$b+1] eq 'x') {
  print "your seat=$b\n" 
 }
}
