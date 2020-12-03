#!/usr/bin/perl
@a=<STDIN>;
$width=length($a[0])-1;
$tot=1;
for('1,1', '3,1', '5,1', '7,1', '1,2') {
 ($right,$down)=split(/,/);
 $ypos=$xpos=$tree=0;
 while($ypos < scalar @a) {
  $xpos+=$right;
  $ypos+=$down;
  $z=substr(@a[$ypos],$xpos % $width,1);
  $tree+=$z eq '#';
 }
 $tot *= $tree;
}
print "$tot\n";
