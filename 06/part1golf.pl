#!/usr/bin/perl
$/='';
while(<>){
 undef%h;
 foreach(split(//)){$h{$_}='x'if/\w/}
 $t+=scalar keys%h
}
die$t
