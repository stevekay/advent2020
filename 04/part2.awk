#!/usr/bin/awk -f
BEGIN {RS=""} {
 $0=$0" "
 c+=/byr:(19[2-9][0-9]|200[012])[\n ]/ &&
    /iyr:20(1[0-9]|20)[\n ]/ &&
    /eyr:20(2[0-9]|30)[\n ]/ &&
    ( /hgt:1([5-8][0-9]|9[0-3])cm[\n ]/ ||
      /hgt:(59|6[0-9]|7[0-6])in[\n ]/ ) &&
    /hcl:#[0-9a-f]{6}[\n ]/ &&
    /ecl:(amb|blu|brn|gry|grn|hzl|oth)[\n ]/ &&
    /pid:[0-9]{9}[\n ]/
}END{print c}
