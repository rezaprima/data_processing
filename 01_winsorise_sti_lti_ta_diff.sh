mkdir percentile
for f in STI_LTI_TA_diff.csv ; do
	echo "MILLER ${f}"
	mlr --itsv --otsv --from "${f}" stats1 -a p1,p99 -f lti_ta,sti_ta,sti_diff,lti_diff -g country,year,quarter > "percentile/${f}"
done

mkdir winsorised
for f in STI_LTI_TA_diff.csv ; do
	echo "WINSO ${f}"
	query="select a.ticker, a.company, a.country, a.sector, a.year, a.quarter, a.ta, a.sti, a.lti"
	query+=", case when a.sti_ta<b.sti_ta_p1 then b.sti_ta_p1 when a.sti_ta>b.sti_ta_p99 then b.sti_ta_p99 else a.sti_ta end sti_ta"
	query+=", case when a.lti_ta<b.lti_ta_p1 then b.lti_ta_p1 when a.lti_ta>b.lti_ta_p99 then b.lti_ta_p99 else a.lti_ta end lti_ta"
	query+=", case when a.sti_diff<b.sti_diff_p1 then b.sti_diff_p1 when a.sti_diff>b.sti_diff_p99 then b.sti_diff_p99 else a.sti_diff end sti_diff"
	query+=", case when a.lti_diff<b.lti_diff_p1 then b.lti_diff_p1 when a.lti_diff>b.lti_diff_p99 then b.lti_diff_p99 else a.lti_diff end lti_diff"
	query+=" from ${f} a join percentile/${f} b on a.country=b.country and a.year=b.year and a.quarter=b.quarter"
	q -H -t -T -O "${query}" > "winsorised/${f}"
done