
for i in $1/*.sam; do

  echo $i
  cat $i | grep "^[^@;]" | awk '{print $3}' | sort | uniq -c | sort -nr > $i.species.txt

done
