#!/usr/bin/perl
while(<>) {
 chomp;
 push @p,$_;
}

for $x ( 0 .. $#p) {
 if($p[$x] =~ /(jmp|nop)(.*)/) {
  $bak=$p[$x];
  if($1 eq 'jmp') { $p[$x]="nop$2" }
  if($1 eq 'nop') { $p[$x]="jmp$2" }
  $zz=&runprog;
  die $zz if($zz != 'abort');
  $p[$x]=$bak;
 }
}
sub runprog() {
 my($pos,$acc,@z);
 while( $pos <= $#p && defined(@z[$pos] == 0) ) {
  return 'abort' if(defined(@z[$pos]));
  $z[$pos] = 1;
  $pos += $1 - 1 if($p[$pos] =~ /^jmp (.*)/);
  $acc += $1 if($p[$pos] =~ /acc (.*)/);
  $pos ++;
 }
 return $acc
}

