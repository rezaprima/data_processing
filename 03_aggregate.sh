mkdir aggregate
alias aq=q -H -T -t -O

for (( i = 1; i <= 10; i++ )); do
	subquery1="select a.country country, a.year, a.quarter"
	subquery1+=", sum(a.ratio) sum_ratio"
	subquery1+=", sum(case coalesce(a.ratio, '') when '' then 0 else 1 end) cnt"
	subquery1+=", avg(a.ratio) rerata"
	subquery1+=" from ratio/ratio${i}.tsv a"
	subquery1+=" where year between 2005 and 2015 "
	subquery1+=" group by a.country, a.year, a.quarter"
	# echo $subquery1

	q -H -T -t -O "${subquery1}" > "aggregate/ratio${i}.tsv"
done

