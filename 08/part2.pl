#!/usr/bin/perl
while(<>) {
 chomp;
 push @p,$_;
}
for $x (0 .. $#p) {
 printf "%03d %s\n",$x,$p[$x];
}

for $x ( 0 .. $#p) {
 print "attempt $x\n";
 if($p[$x] =~ /^jmp(.*)/) {
  print "hacking the jmp at pos $x to be a nop\n";
  print "was ->\n";
  for $x (0 .. $#p) {
   printf "  %03d %s\n",$x,$p[$x];
  }
  $bak=$p[$x];
  $p[$x]="nop" . $1;
  print "now ->\n";
  for $x (0 .. $#p) {
   printf "  %03d %s\n",$x,$p[$x];
  }
  $zz=&runprog;
  $p[$x]=$bak;
  print " -> result = $zz\n\n\n";
  if($zz != 'abort') {
   print "win !!! $zz\n\n";
   exit;
  }
 }
}
sub runprog() {
 $pos=0;
 $acc=0;
 undef @z;
 while( $pos <= $#p ) {
  if(defined(@z[$pos])) {
   print "aborted at pos $pos with acc $acc\n";
   return "abort";
   exit;
  }
  $z[$pos]=1;
  print "at pos $pos, processing instruction ",$p[$pos],"\n"; 
  if($p[$pos] =~ /^jmp (.*)/) {
   print " -> got a jump to $1\n";
   $pos += $1;
   print " -> so new pos is $pos\n";
   next;
  }
  if($p[$pos] =~ /acc (.*)/) {
   $acc += $1;
  }
  $pos++;
  print "\n\n";
 }
 print "acc=$acc\n";
 return $acc;
}

