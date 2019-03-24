mkdir converted
for d in "Balance Sheet" "Cash Flow" "Income Statement"; do
	echo $d
	cd $d
	for f in *_unpivot.csv; do
		input=$f
		echo $input
		output=`echo $input | sed -e "s/,//g" | sed -e "s/ /_/g" | sed -e "s/__/_/g" | sed -e "s/_unpivot//g" `
		echo $output
		iconv -f utf-16 -t ascii $input > "../converted/${output}"
	done
	cd ..
done
