mkdir percentile
for f in gabungan.txt ; do
	echo "MILLER ${f}"
	mlr --itsv --otsv --from "${f}" stats1 -a p1,p99 -f lti_ta,sti_ta -g country,year,quarter > "percentile/${f}"
done

mkdir winsorised
for f in gabungan.txt ; do
	echo "WINSO ${f}"
	query="select a.ticker, a.uniqid, a.company, a.country, a.sector, a.year, a.quarter, a.total_asset, a.short_term_investment, a.long_term_investment"
	query+=", case when a.sti_ta<b.sti_ta_p1 then b.sti_ta_p1 when a.sti_ta>b.sti_ta_p99 then b.sti_ta_p99 else a.sti_ta end sti_ta"
	query+=", case when a.lti_ta<b.lti_ta_p1 then b.lti_ta_p1 when a.lti_ta>b.lti_ta_p99 then b.lti_ta_p99 else a.lti_ta end lti_ta"
	query+=" from ${f} a join percentile/${f} b on a.country=b.country and a.year=b.year and a.quarter=b.quarter"
	q -H -t -T -O "${query}" > "winsorised/${f}"
done