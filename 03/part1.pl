#!/usr/bin/perl
@a=<>;
$width=length($a[0])-1;
while($ypos < scalar @a) {
 $xpos+=3;
 $z=substr(@a[++$ypos],$xpos % $width,1);
 $tree+=$z eq '#';
}
print "$tree\n";
