yearQuery="substr(a.Quarter,1,4) "
quarterQuery="case substr(a.Quarter,6) when 'FQ0' then 4 "
quarterQuery+="when 'FQ-1' then 3 "
quarterQuery+="when 'FQ-2' then 2 "
quarterQuery+="when 'FQ-3' then 1 end "

a1="Short_Term_Investment.csv"
b1="Total_Asset.csv"
c1="Long_Term_Investments.csv"
dir="."
subquery1="select row_number() over(order by a.Identifier"
subquery1+=", ${yearQuery} "
subquery1+=", ${quarterQuery} "
subquery1+=" ) as rownum, a.Identifier as ticker, a.CompanyName as company, a.Country as country, a.SectorName as sector"
subquery1+=", ${yearQuery} year"
subquery1+=", ${quarterQuery} quarter"
subquery1+=", 1.0*a.value/b.value sti_ta"
subquery1+=", 1.0*c.value/b.value lti_ta"
subquery1+=", a.value sti"
subquery1+=", c.value lti"
subquery1+=", b.value ta"
subquery1+=" from ${dir}/${a1} a join ${dir}/${b1} b on a.Identifier=b.Identifier and a.Quarter=b.Quarter"
subquery1+=" left outer join ${dir}/../CSV_SIAP_OLAH/${c1} c on a.Identifier=c.Identifier and a.Quarter=c.Quarter"
echo $subquery1

q -H -T -t -O "${subquery1}" > STI_LTI_TA.csv

# subquery1="select row_number() rownum, ticker, company, country, sector, year, quarter from ./STI_TA.csv"
# q -H -T -t -O "${subquery1}" > STI_TA_num.csv

subquery1="select a.ticker, a.company, a.country, a.sector, b.year, b.quarter"
subquery1+=", b.sti"
subquery1+=", b.lti"
subquery1+=", b.ta"
subquery1+=", b.sti_ta"
subquery1+=", b.lti_ta"
subquery1+=", (b.sti_ta-a.sti_ta)/a.sti_ta sti_diff"
subquery1+=", (b.lti_ta-a.lti_ta)/a.lti_ta lti_diff"
subquery1+=" from ./STI_LTI_TA.csv a join ./STI_LTI_TA.csv b on a.ticker=b.ticker and b.rownum=a.rownum+1"

echo $subquery1
q -H -T -t -O "${subquery1}" > STI_LTI_TA_diff.csv


