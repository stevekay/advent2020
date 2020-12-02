#!/usr/bin/awk -f
{
  a[NR]=$0
  for(x=1;x<NR;x++){
    if($0+a[x]==2020){
      print $0*a[x]
    }
  }
}
