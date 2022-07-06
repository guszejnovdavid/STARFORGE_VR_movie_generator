#!/bin/sh



for num in {0..15}
do
    echo -e folder $num done
    rm $num/*.png
    rm $num/*.err
    rm $num/*.out
done

