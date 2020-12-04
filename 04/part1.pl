#!/usr/bin/perl
while(<>) {
    chomp;
    $buf .= " $_";
    if(!/\S/ || eof){ 
        $c=0;
        for $tag (qw/ecl pid eyr hcl byr iyr hgt/) {
             $c+= ($buf =~ m/$tag:/);
        }
        if($c==7) {
            $x++
        }
        $buf='';
    }
}
print "$x\n";
