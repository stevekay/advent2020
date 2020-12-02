#!/usr/bin/awk -f
(substr($3,substr($1,0,index($1,"-")-1),1) == substr($2,0,1) ) + \
(substr($3,substr($1,index($1,"-")+1,1))==substr($2,0,1)) == 1 {
 c++
}END{print c}
