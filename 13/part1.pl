#!/usr/bin/perl
($t,$buses)=<>;
chomp $t;
chomp $buses;
for(split(/,/,$buses)) {
 if($_ ne 'x') { push @bus,$_ ; push @dep,0}
}

$x=0;
while(1) {

 for $b (0 .. $#bus) {
  if($dep[$b] == 0) {
   if($x >= $t) { $z = ($x - $t) * $bus[$b] ; die $z }
   $dep[$b]=$bus[$b]-1;
  } else {
   $dep[$b]--;
  }
 }

 $x++;
}
