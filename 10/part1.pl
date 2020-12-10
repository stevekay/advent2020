#!/usr/bin/perl

$max=-1;
while(<>) {
 chomp;
 if($_ > $max) { $max = $_ }
 push @a,$_;
 #print $_,"\n";
}
#print "max was $max\n";
$rating=$max+3;
#print "rating is $rating\n";

&lookfor(0);

#for(@a) {
# if($_ < 4) {
#  print $_,"\n";
# }
#}

sub lookfor() {
 local($l)=@_;
 local($b);
# print "looking for $l\n";
 for $b ( 0 .. $#a ) {
  $match='';
  if($a[$b] > $l && $a[$b] <= $l+3) { $match='match' }
#  printf "%03d value %4d %s\n",$b,$a[$b],$match;
  if($a[$b] > $l && $a[$b] <= $l+3) { 
#   print " -> found a match, value ",$a[$b],"\n";
   if($a[$b] == $l + 1) { 
#    print "  -> diff was 1\n";
    $onediff++ }
   if($a[$b] == $l + 3) { 
#    print "  -> diff was 3\n";
    $threediff++ }
   $z=$a[$b];
   &lookfor($a[$b]) }
 }
# print "done\n";
 
 $threediff++;
# print "z=$z\n";
# print "onediff=$onediff\n";
# print "threediff=$threediff\n";
 print "answer=",$onediff * $threediff,"\n";
 exit;
}
