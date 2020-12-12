#!/usr/bin/perl
@p=<STDIN>;
while(defined(@z[$pos])==0) {
 $z[$pos]=1;
 if($p[$pos] =~ /jmp (\S+)/) {
  $pos += $1;
  next;
 }
 $acc += $1 if($p[$pos++] =~ /acc (\S+)/);
}
die $acc;
