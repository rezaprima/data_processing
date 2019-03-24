dir="."


yearQuery="substr(a.Quarter,1,4) year"
quarterQuery="case substr(a.Quarter,6) when 'FQ0' then 4 "
quarterQuery+="when 'FQ-1' then 3 "
quarterQuery+="when 'FQ-2' then 2 "
quarterQuery+="when 'FQ-3' then 1 end quarter "

a1="Total_Current_Asset.txt"
b1="Total_Current_Liabilities.txt"
subquery1="select a.Identifier, a.CompanyName, a.Country, a.SectorName, a.Quarter "
subquery1+=", 1.0*a.value/b.value Value"
subquery1+=" from ${dir}/${a1} a join ${dir}/${b1} b on a.Identifier=b.Identifier and a.Quarter=b.Quarter"
#echo $subquery1

q -H -T -t -O "${subquery1}" > ca_cl.txt



a1="Cash.txt"
b1="Total_Asset.txt"
subquery1="select a.Identifier, a.CompanyName, a.Country, a.SectorName, a.Quarter "
subquery1+=", 1.0*a.value/b.value Value"
subquery1+=" from ${dir}/${a1} a join ${dir}/${b1} b on a.Identifier=b.Identifier and a.Quarter=b.Quarter"
#echo $subquery1

q -H -T -t -O "${subquery1}" > cash_ta.txt



a1="Total_Current_Asset.txt"
b1="Total_Asset.txt"
subquery1="select a.Identifier, a.CompanyName, a.Country, a.SectorName, a.Quarter "
subquery1+=", 1.0*a.value/b.value Value"
subquery1+=" from ${dir}/${a1} a join ${dir}/${b1} b on a.Identifier=b.Identifier and a.Quarter=b.Quarter"
#echo $subquery1

q -H -T -t -O "${subquery1}" > ca_ta.txt



a1="Total_Current_Liabilities.txt"
b1="Total_Asset.txt"
subquery1="select a.Identifier, a.CompanyName, a.Country, a.SectorName, a.Quarter "
subquery1+=", 1.0*a.value/b.value Value"
subquery1+=" from ${dir}/${a1} a join ${dir}/${b1} b on a.Identifier=b.Identifier and a.Quarter=b.Quarter"
#echo $subquery1

q -H -T -t -O "${subquery1}" > cl_ta.txt



a1="Total_Inventory.txt"
b1="Total_Asset.txt"
subquery1="select a.Identifier, a.CompanyName, a.Country, a.SectorName, a.Quarter "
subquery1+=", 1.0*a.value/b.value Value"
subquery1+=" from ${dir}/${a1} a join ${dir}/${b1} b on a.Identifier=b.Identifier and a.Quarter=b.Quarter"
#echo $subquery1

q -H -T -t -O "${subquery1}" > ti_ta.txt



