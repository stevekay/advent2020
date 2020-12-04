#!/usr/bin/awk -f
BEGIN {
  RS=""
} gsub(/(ecl|pid|[ebi]yr|hcl|hgt):/,$0) == 7 {
  c++
} END {
  print c
}
