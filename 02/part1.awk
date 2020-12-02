#!/usr/bin/awk -f
{
 a=gsub(substr($2,0,1),"!",$3)
 if(a >= substr($1,0,index($1,"-")-1) && 
    a < substr($1,index($1,"-")+1)+1) {
   c++
 }
} END {
 print c
}
