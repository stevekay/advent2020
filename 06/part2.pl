#!/usr/bin/perl
while(<>) {
 chomp;

 $buf .= " $_";
 if(!/\S/ || eof){
  undef %questions;
  $people=-1;
  foreach $c (split(//,$buf)) {
   if($c =~ m/^[a-z]/) { $questions{$c}++ }
   if($c eq ' ') { $people++ }
  }
  $bad=0;
  foreach $q (sort keys %questions) {
   if($questions{$q} == $people) { $t++ }
  }
  $buf='';
 }
}
die $t;
