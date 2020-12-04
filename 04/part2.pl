#!/usr/bin/perl
while(<>) {
    chomp;
    $buf .= " $_";
    if(!/\S/ || eof){ 
        $c+= ( ($buf =~ m/byr:(\d{4}) / && $1>=1920 && $1<=2002) &&
               ($buf =~ m/iyr:(\d{4}) / && $1>=2010 && $1<=2020) &&
               ($buf =~ m/eyr:(\d{4}) / && $1>=2020 && $1<=2030) &&
               (
                 ($buf =~ m/hgt:(\d+)cm / && $1>=150 && $1<=193) ||
                 ($buf =~ m/hgt:(\d+)in / && $1>=59 && $1<=76)
               ) &&
               $buf =~ m/hcl:#[0-9a-f]{6} / &&
               $buf =~ m/ecl:(amb|blu|brn|gry|grn|hzl|oth) / &&
               $buf =~ m/pid:\d{9} /);
        $buf='';
    }
}
print "$c\n";
