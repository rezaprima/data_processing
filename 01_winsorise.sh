mkdir percentile
f=$1
	echo "MILLER ${f}"
	mlr --itsv --otsv --from "${f}" stats1 -a p1,p99 -f Value -g Country,Quarter > "percentile/${f}"
mkdir winsorised

	echo "WINSO ${f}"
	query="select a.Identifier, a.CompanyName, a.Country, a.SectorName, a.Quarter"
	query+=", case when a.Value<b.Value_p1 then b.Value_p1 when a.Value>b.Value_p99 then b.Value_p99 else a.Value end Value"
	query+=" from ${f} a join percentile/${f} b on a.Country=b.Country and a.Quarter=b.Quarter"
	q -H -t -T -O "${query}" > "winsorised/${f}"