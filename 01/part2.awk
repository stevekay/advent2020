#!/usr/bin/awk -f
{
  a[NR]=$0
  for(x=1;x<NR;x++){
    for(y=1;y<NR;y++){
      if($0+a[x]+a[y]==2020){
        print $0*a[x]*a[y]
        exit
      }
    }
  }
}
