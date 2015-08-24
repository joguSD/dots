#jogujogu
echo "${0}"
INPUT="i
Horea
123
w
i
Bree
234
w
i
Horea
333
w
i
Peter
345
w
i
Jordan
456
w
i
Ted
567
w
i
Jordan
444
w
i
Bob
999"

./Driver2 -x &> test.out << EOF
$INPUT
EOF
~/../public/hw6/Driver2 -x &> ref.out << EOF
$INPUT
EOF

dif=`diff test.out ref.out | wc -l`
if [ "$dif" == "0" ]; then
    echo 'NO DIFFERENCES!!';
else
    vimdiff test.out ref.out
fi
