#!/usr/bin/perl
while(<>) {
 for$v(@a){die$v*$_ if($v+$_==2020)}
 push@a,$_;
}
