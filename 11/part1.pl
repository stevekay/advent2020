#!/usr/bin/perl
while(<>) {
 chomp;
 push @a,$_;
}

# put into proper array
for $y ( 0 .. $#a) {
 for $x ( 0 .. length($a[$y])) {
  $b[$y][$x]=substr($a[$y],$x,1);
 }
}

# figure out dimensions
$maxy=$#a;
$maxx=length($a[0]);

while(1) {
 $round++;
 $changes=0;
 
 # copy array b to array c
 @c = map { [@$_] } @b;

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
   
   if($b[$y][$x] eq 'L' && $occupied==0) { 
    $changes++;
    $c[$y][$x]='#';
   }
   if($b[$y][$x] eq '#' && $occupied > 3) { 
    $changes++;
    $c[$y][$x]='L';
   }
  }
 }

 print "round $round resulted in $changes changes\n"; 
 if($changes == 0) {
  $seats=0;
  for $y ( 0 .. $maxy) {
   for $x ( 0 .. $maxx) {
    $seats++ if $b[$y][$x] eq '#';
   }
  }
  die " -> seats = $seats\n";
 }
 # copy array c to array b
 # now need to copy array c to array b 
 $b=();
 for $y ( 0 .. $maxy) {
  for $x ( 0 .. $maxx) {
   $b[$y][$x]=$c[$y][$x];
  }
 }
}

sub look() {
 my($ydelta,$xdelta)=@_;
 $v=$b[$y+$ydelta][$x+$xdelta]; 
 if($v ne '.') {
  return $v;
 }
 return '';
}
