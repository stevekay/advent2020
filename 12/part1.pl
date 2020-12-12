#!/usr/bin/perl
$facing ='E';
while(<>) {
 if(/^([NSEWF])(\d+)/) {
  $dir = $1;
  $dist = $2;

  if($dir eq 'F') { $dir = $facing }

  if($dir eq 'N') { $y += $dist }
  if($dir eq 'S') { $y -= $dist }
  if($dir eq 'E') { $x += $dist }
  if($dir eq 'W') { $x -= $dist }
 } 

 if(/^([LR])(\d+)/) {
  $turn = $1;
  $b = index('NESW',$facing);

  if($turn eq 'L') { $b -= $2 / 90 }
  if($turn eq 'R') { $b += $2 / 90 }
  if($b<0) { $b = 4+$b }

  $b = $b % 4;
  $facing = substr('NESW',$b,1);
 }
}

die abs($x)+abs($y)
