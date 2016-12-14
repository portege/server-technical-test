#!/bin/bash

date > answer

ip=127.0.0.1
limit=500
z=`shuf -i 0-$limit -n 1`
y=`shuf -i 0-$limit -n 1`

for (( x=0; x<=$limit; x++ ))
do
        a=$RANDOM
        b=$RANDOM
        c=$RANDOM
        d=$RANDOM
        f=`md5sum<<<$a | awk '{print $1}'`
        g=`md5sum<<<$b | awk '{print $1}'`
        h=`md5sum<<<$c | awk '{print $1}'`
        i=`md5sum<<<$d | awk '{print $1}'`
        mkdir -p "$a/$b/$c/$d"
        touch "$a/$b/$c/$d/$f"
        mkdir -p "$a/$b/$d/$c"
        touch "$a/$b/$d/$c/$g"
        mkdir -p "$a/$c/$b/$d"
        touch "$a/$c/$b/$d/$h"
        mkdir -p "$a/$c/$d/$b"
        touch "$a/$c/$d/$b/$i"

# index.html
        if [ $x -eq $z ]; then
                echo 'hi!' > "$a/$b/$c/$d/index.html"
                echo "1. index file http://$ip/index.html" >> answer
        fi

# immutable file
        if [ $x -eq $y ]; then
                echo 'delete me!' >  "$a/$c/$d/$b/$i"
                `sudo chattr +i  $a/$c/$d/$b/$i`
                echo "2. immutable file ($a/$c/$d/$b/$i)" >> answer
        fi
done

# running forever apps
echo ' while :;do sleep 1; done' > killme
chmod u+x killme
nohup ./killme &
sleep 2
rm -rf killme
echo "3. running apps 'killme'" >> answer

# create multilines file
v=`shuf -i 0-1000 -n 1`
for (( o=0; o<=1000; o++ ))
do
        echo $o >> "$a/$b/$d/$c/$g"
        if [ $o -eq $v ]; then
                echo 'remove me!' >>  "$a/$b/$d/$c/$g"
                echo "4. file editing ($a/$b/$d/$c/$g)" >> answer
        fi
done
