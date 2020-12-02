#!/usr/bin/perl
while(<>) {
 /^(\d+)-(\d+) (.): ([a-z]+)/;
 
 $min=$1;
 $max=$2;
 $char=$3;
 $pass=$4;

 $count = () = $pass =~ /\Q$char/g;
 if($count >= $min && $count <= $max) { $good++ }
}
print "$good\n";
