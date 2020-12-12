#!/usr/bin/perl
$facing ='E';
while(<>) {
 next unless /^(.)(\d+)/;
 $dir = $1 eq 'F' ? $facing : $1;
 if($dir eq 'N') { $y += $2 }
 if($dir eq 'S') { $y -= $2 }
 if($dir eq 'E') { $x += $2 }
 if($dir eq 'W') { $x -= $2 }
 if($dir eq 'L' || $dir eq 'R') {
  $b = index('NESW',$facing);
  if($dir eq 'L') { $b -= $2 / 90 }
  if($dir eq 'R') { $b += $2 / 90 }
  if($b < 0) { $b = 4 + $b }
  $facing = substr('NESW',$b % 4,1);
 }
}
die abs($x)+abs($y)
