#!/usr/bin/perl
while(<>) {
 chomp;
 push @p,$_;
}

for $x ( 0 .. $#p) {
 if($p[$x] =~ /jmp(.*)/) {
  $p[$x]="nop$1";
  $zz=&runprog;
  $p[$x]="jmp$1";
  die $zz if($zz != 'abort');
 }

 if($p[$x] =~ /nop(.*)/) {
  $p[$x] = "jmp$1";
  $zz = &runprog;
  $p[$x] = "nop$1";
  die $zz if($zz != 'abort');
 }

}
sub runprog() {
 my($pos,$acc,@z);
 while( $pos <= $#p ) {
  return 'abort' if(defined(@z[$pos]));
  $z[$pos] = 1;
  $pos += $1 - 1 if($p[$pos] =~ /^jmp (.*)/);
  $acc += $1 if($p[$pos] =~ /acc (.*)/);
  $pos ++;
 }
 return $acc
}

