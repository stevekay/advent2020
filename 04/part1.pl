#!/usr/bin/perl
while(<>) {
    $buf .= " $_";
    if(!/\S/ || eof){ 
        $c=0;
        for $tag (qw/ecl pid eyr hcl byr iyr hgt/) {
             $c+= ($buf =~ m/$tag:/);
        }
        $x++ if $c==7;
        $buf='';
    }
}
print "$x\n";
