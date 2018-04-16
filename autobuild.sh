timemod=`date -r $1 +%s`

while true ; do
  if [ "`date -r $1 +%s`" != "$timemod" ] ; then
    pdflatex -interaction=nonstopmode $1 > output_$1.tmp
    
    if [ "$?" != "0" ] ; then
      cat output_$1.tmp
    fi
    
    rm output_$1.tmp
    timemod=`date -r $1 +%s`
  fi
  sleep 1
done


