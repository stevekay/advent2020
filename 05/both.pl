#!/usr/bin/perl
while(<>) {
 $r=$c=0;
 $s=127;
 $d=7;
 foreach(split(//,substr($_,0,10))){
  $s=($s-1-$r)/2+$r if /F/;
  $r=($s+1-$r)/2+$r if /B/;
  $d=($d-1-$c)/2+$c if /L/;
  $c=($d+1-$c)/2+$c if /R/;
 }
 $_=$r*8+$c;
 if($_>$max){$max=$_}
 $a[$_]='x'
}
for(1..$#a-1){
 print"$max $_"if($a[$_] ne 'x'&&$a[$_-1]&&$a[$_+1])
}
