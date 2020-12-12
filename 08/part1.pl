#!/usr/bin/perl
@p=<STDIN>;
while(1) {
 die $acc if(defined(@z[$pos]));
 $z[$pos]=1;
 if($p[$pos] =~ /jmp (\S+)/) {
  $pos += $1;
  next;
 }
 $acc += $1 if($p[$pos++] =~ /acc (\S+)/);
}

