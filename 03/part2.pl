#!/usr/bin/perl
my($right,$down)=@ARGV;
@a=<STDIN>;
$width=length($a[0])-1;
while($ypos < scalar @a) {
 $xpos+=$right;
 $ypos+=$down;
 $z=substr(@a[$ypos],$xpos % $width,1);
 $tree+=$z eq '#';
}
print "$tree\n";
