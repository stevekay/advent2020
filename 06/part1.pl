#!/usr/bin/perl
while(<>) {
 $b .= " $_";
 next unless !/\S/ || eof;
 undef %h;
 foreach(split(//,$b)) {
  $h{$_} = 'x' if /\w/
 }
 $t += scalar keys %h;
 $b = ''
}
die $t
