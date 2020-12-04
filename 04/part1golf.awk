#!/usr/bin/awk -f 
BEGIN{RS=z}gsub(/(ecl|pid|[ebi]yr|hcl|hgt):/,$0)==7{c++}END{print c}
