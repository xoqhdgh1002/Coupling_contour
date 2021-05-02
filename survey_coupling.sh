#!/bin/bash

if ! test -d "Done_${1}_${2}"; then
mkdir Done_${1}_${2}
fi

echo "Mass,gV,cq,ch,decay_width,Xsec" >> survey_coupling_${1}_${2}.csv

xsec=3.90490*10^-4
xsec=`echo "scale=11;$xsec"|bc`
i=1
trig=0

for ((cf=30; cf>=1; cf--));do

  for ((ch=1; ch<=30; ch++));do

    if test -e 'SubProcesses/results.dat'; then
    rm SubProcesses/results.dat  
    fi
    if [ $ch -lt $i ];then
    continue
    fi
    ./Auto.dat $1 $2 $cf $ch > Cards/param_card.dat
    ./bin/madevent survey
    if test -e 'SubProcesses/results.dat'; then
    var1=$(cut -d " " -f 1 SubProcesses/results.dat)
    var2=`echo "scale=11;$(echo $var1 | sed "s/[eE]/\*10\^/")"|bc`
    decay_width=$(cat Cards/param_card.dat | grep "DECAY  9000002" | sed 's/DECAY  9000002   //' | sed 's/ #.*//')
    decay_width2=`echo "scale=11;$(echo $decay_width | sed "s/[eE]/\*10\^/" | sed "s/+//")"|bc`
    var3=`echo "scale=11;${var2}*${decay_width2}"|bc`
    if [ $(echo "$var3 > $xsec"|bc) -ne 0 ];then

      echo "${1}.000000e+03,${2}.000000e+00,${cf}.000000e-01,${ch}.000000e-01,${decay_width},${var1}" >> survey_coupling_${1}_${2}.csv
      i=$ch
      break

    fi
    fi
    touch Done_${1}_${2}/${cf}_${ch}.done
    if [ $ch -eq 30 ];then
      trig=1
    fi
  done
  if [ $trig -eq 1 ];then
  break
  fi 
done
i=-1
trig=0

for ((cf=30; cf>=1; cf--));do
  
  for ((ch=-1; ch>=-30; ch--));do
  
    if test -e 'SubProcesses/results.dat'; then
    rm SubProcesses/results.dat  
    fi
    if [ $ch -gt $i ];then
    continue
    fi
    ./Auto.dat $1 $2 $cf $ch > Cards/param_card.dat
    ./bin/madevent survey
    if test -e 'SubProcesses/results.dat'; then
    var1=$(cut -d " " -f 1 SubProcesses/results.dat)
    var2=`echo "scale=11;$(echo $var1 | sed "s/[eE]/\*10\^/")"|bc`
    decay_width=$(cat Cards/param_card.dat | grep "DECAY  9000002" | sed 's/DECAY  9000002   //' | sed 's/ #.*//')
    decay_width2=`echo "scale=11;$(echo $decay_width | sed "s/[eE]/\*10\^/" | sed "s/+//")"|bc`
    var3=`echo "scale=11;${var2}*${decay_width2}"|bc`
    if [ $(echo "$var3 > $xsec"|bc) -ne 0 ];then

      echo "${1}.000000e+03,${2}.000000e+00,${cf}.000000e-01,${ch}.000000e-01,${decay_width},${var1}" >> survey_coupling_${1}_${2}.csv
      i=$ch
      break

    fi
    fi

    touch Done_${1}_${2}/${cf}_${ch}.done
    if [ $ch -eq -30 ];then
      trig=1
    fi
  done
  if [ $trig -eq 1 ];then
  break
  fi 
done
i=1
trig=0

for ((cf=-30; cf<=-1; cf++));do

  for ((ch=1; ch<=30; ch++));do

    if test -e 'SubProcesses/results.dat'; then
    rm SubProcesses/results.dat  
    fi
    if [ $ch -lt $i ];then
    continue
    fi
    ./Auto.dat $1 $2 $cf $ch > Cards/param_card.dat
    ./bin/madevent survey
    if test -e 'SubProcesses/results.dat'; then
    var1=$(cut -d " " -f 1 SubProcesses/results.dat)
    var2=`echo "scale=11;$(echo $var1 | sed "s/[eE]/\*10\^/")"|bc`
    decay_width=$(cat Cards/param_card.dat | grep "DECAY  9000002" | sed 's/DECAY  9000002   //' | sed 's/ #.*//')
    decay_width2=`echo "scale=11;$(echo $decay_width | sed "s/[eE]/\*10\^/" | sed "s/+//")"|bc`
    var3=`echo "scale=11;${var2}*${decay_width2}"|bc`
    if [ $(echo "$var3 > $xsec"|bc) -ne 0 ];then

      echo "${1}.000000e+03,${2}.000000e+00,${cf}.000000e-01,${ch}.000000e-01,${decay_width},${var1}" >> survey_coupling_${1}_${2}.csv
      i=$ch
      break

    fi
    fi

    touch Done_${1}_${2}/${cf}_${ch}.done
    if [ $ch -eq 30 ];then
      trig=1
    fi
  done
  if [ $trig -eq 1 ];then
  break
  fi 
done
i=-1
trig=0

for ((cf=-30; cf<=-1; cf++));do

  for ((ch=-1; ch>=-30; ch--));do

    if test -e 'SubProcesses/results.dat'; then
    rm SubProcesses/results.dat  
    fi
    if [ $ch -gt $i ];then
    continue
    fi
    ./Auto.dat $1 $2 $cf $ch > Cards/param_card.dat
    ./bin/madevent survey
    if test -e 'SubProcesses/results.dat'; then
    var1=$(cut -d " " -f 1 SubProcesses/results.dat)
    var2=`echo "scale=11;$(echo $var1 | sed "s/[eE]/\*10\^/")"|bc`
    decay_width=$(cat Cards/param_card.dat | grep "DECAY  9000002" | sed 's/DECAY  9000002   //' | sed 's/ #.*//')
    decay_width2=`echo "scale=11;$(echo $decay_width | sed "s/[eE]/\*10\^/" | sed "s/+//")"|bc`
    var3=`echo "scale=11;${var2}*${decay_width2}"|bc`
    if [ $(echo "$var3 > $xsec"|bc) -ne 0 ];then

      echo "${1}.000000e+03,${2}.000000e+00,${cf}.000000e-01,${ch}.000000e-01,${decay_width},${var1}" >> survey_coupling_${1}_${2}.csv
      i=$ch
      break

    fi
    fi
    touch Done_${1}_${2}/${cf}_${ch}.done
    if [ $ch -eq -30 ];then
      trig=1
    fi
  done
  if [ $trig -eq 1 ];then
  break
  fi 
done
