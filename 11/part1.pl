#!/usr/bin/perl
while(<>) {
 chomp;
 push @a,$_;
}
for $y (@a) {
 print "$y\n";
}
# put into proper array
for $y ( 0 .. $#a) {
 for $x ( 0 .. length($a[$y])) {
#  print "adding char ",substr($a[$y],$x,1)," to pos $y,$x\n";
  $b[$y][$x]=substr($a[$y],$x,1);
 }
}
# print it
print "------\n\n";
$maxy=$#a;
$maxx=length($a[0]);
&drawb;
print "maxy=$maxy maxx=$maxx\n";

# process it 
$round=0;

while(1) {
 $round++;
 $changes=0;
 print "start of round $round, looks as below\n";
 &drawb;
 
 # copy array b to array c
 $c=();
 for $y ( 0 .. $maxy) {
  for $x ( 0 .. $maxx) {
   $c[$y][$x]=$b[$y][$x];
  }
 }

 for $y ( 0 .. $maxy) {
  for $x ( 0 .. $maxx) {
   $occupied=0;
   for $myx ( -1 .. 1) {
    for $myy ( -1 .. 1) {
     next if $myx==0 && $myy==0;
     $p=look($myy,$myx);
     $occupied++ if($p eq '#');
    }
   }
#   print "looks as below:\n";
#   &drawb;
#   print "round $round, at pos y=$y x=$x value=",$b[$y][$x]," occupied neighbours=$occupied\n";
#   print "\n";
   
   if($b[$y][$x] eq 'L' && $occupied==0) { 
#    print "  -> empty and no occupied neighbours, so becomes occupied\n";
    $changes++;
    $c[$y][$x]='#';
   }
   if($b[$y][$x] eq '#' && $occupied > 3) { 
#    print "  -> occupied and 4 or more occupied neighbours, so becomes empty 'L'\n"; 
    $c[$y][$x]='L';
    $changes++;
   }
#   &drawc;
  }
 }

 print "round $round resulted in $changes changes\n"; 
 if($changes == 0) {
  $seats=0;
  print "counting seats\n";
  for $y ( 0 .. $maxy) {
   for $x ( 0 .. $maxx) {
    $seats++ if $b[$y][$x] eq '#';
   }
  }
  print " -> seats = $seats\n";
  exit;
 }
 # now need to copy array c to array b 
 $b=();
 for $y ( 0 .. $maxy) {
  for $x ( 0 .. $maxx) {
   $b[$y][$x]=$c[$y][$x];
  }
 }

 # print the results at the end of this round
 print "results at end of round $round\n";
 &drawb;
 
 print "--------------\n\n\n";
}

&drawc;
sub drawb() {
my($yy,$xx);
for $yy ( 0 .. $maxy) {
 $line='';
 for $xx ( 0 .. $maxx) {
#  print "adding value from $y,$x which is set to ",
  $line .= $b[$yy][$xx];
 }
 print $line,"\n";
}
print "\n";
}
sub drawc() {
my($yy,$xx);
for $yy ( 0 .. $maxy) {
 $line='';
 for $xx ( 0 .. $maxx) {
#  print "adding value from $y,$x which is set to ",
  $line .= $c[$yy][$xx];
 }
 print $line,"\n";
}
print "\n";
}

sub look() {
 my($ydelta,$xdelta)=@_;
# print "looking in direction $ydelta,$xdelta from position $y,$x\n";
 $xx=0;
 $yy=0;
 $xx += $xdelta;
 $yy += $ydelta;
 $v=$b[$y+$yy][$x+$xx]; 
 if($v ne '.') {
#  print " result was $v\n";
  return $v;
 }
# print " result was empty\n";
 return '';
}
