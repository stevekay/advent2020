#!/usr/bin/perl
$x=0;
$y=0;
$dirs = 'NESW';
$facing='E';
while(<>) {
 chomp;
 print "x=$x y=$y facing=$facing line=$_\n";
 if(/^([NSEWF])(\d+)/) {
  $dir=$1;
  if($dir eq 'F') { $dir = $facing }
  $dist=$2;
  print " moving $dir by $dist distance\n";
  if($dir eq 'N') { $y += $dist }
  if($dir eq 'S') { $y -= $dist }
  if($dir eq 'E') { $x += $dist }
  if($dir eq 'W') { $x -= $dist }
 } 
 if(/^([LR])(\d+)/) {
  $turn=$1;
  $deg=$2;
  print "turning $turn by $deg degrees\n";
  $deg /= 90;
  print " -> which is rotate by $deg steps\n";
  $b = index($dirs,$facing);
  print "   b=$b\n";
  if($turn eq 'L') { print "turning L"; $b -= $deg }
  if($turn eq 'R') { print "turning R"; $b += $deg }
  print "   new b = $b\n";
  if($b<0) { $b=4+$b }
  $b = $b % 4;
  $facing = substr($dirs,$b,1);
  print "new dir is ",substr($dirs,$b,1),"\n";
 }
 print "  new pos is east $x north $y\n";
}

print "answer is ",abs($x) + abs($y),"\n";
