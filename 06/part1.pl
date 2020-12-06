#!/usr/bin/perl
while(<>) {
 chomp;

 $buf .= " $_";
 if(!/\S/ || eof){
  undef %h;
  foreach $c (split(//,$buf)) {
   if($c =~ m/^[a-z]/) { $h{$c}='x' }
  }
  $t+=scalar keys %h;
  $buf='';
 }
}
die $t;
