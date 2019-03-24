mkdir ratio
alias aq=q -H -T -t -O
dir="winsorised"


yearQuery="substr(a.Quarter,1,4) year"
quarterQuery="case substr(a.Quarter,6) when 'FQ0' then 4 "
quarterQuery+="when 'FQ-1' then 3 "
quarterQuery+="when 'FQ-2' then 2 "
quarterQuery+="when 'FQ-3' then 1 end quarter "
a1="Operating_Income.csv"
b1="Interest_Expense_Net_-_Operating.csv"
subquery1="select a.Identifier ticker, a.CompanyName company, a.Country country, a.SectorName sector"
subquery1+=", ${yearQuery} "
subquery1+=", ${quarterQuery} "
subquery1+=", 1.0*a.value/b.value ratio"
subquery1+=", a.value value1"
subquery1+=", b.value value2"
subquery1+=" from ${dir}/${a1} a join ${dir}/${b1} b on a.Identifier=b.Identifier and a.Quarter=b.Quarter"
#echo $subquery1

q -H -T -t -O "${subquery1}" > ratio/ratio1.tsv

a1="Operating_Income.csv"
b1="Total_Operating_Expense.csv"
subquery1="select a.Identifier ticker, a.CompanyName company, a.Country country, a.SectorName sector"
subquery1+=", ${yearQuery} "
subquery1+=", ${quarterQuery} "
subquery1+=", 1.0*a.value/b.value ratio"
subquery1+=", a.value value1"
subquery1+=", b.value value2"
subquery1+=" from ${dir}/${a1} a join ${dir}/${b1} b on a.Identifier=b.Identifier and a.Quarter=b.Quarter"
#echo $subquery1

q -H -T -t -O "${subquery1}" > ratio/ratio2.tsv




a1="Operating_Income.csv"
b1="Interest_Expense_Net_-_Operating.csv"
c1="Total_Debt.csv"
subquery1="select a.Identifier ticker, a.CompanyName company, a.Country country, a.SectorName sector"
subquery1+=", ${yearQuery} "
subquery1+=", ${quarterQuery} "
subquery1+=", 1.0*a.value/(b.value+c.value) ratio"
subquery1+=", a.value value1"
subquery1+=", b.value value2"
subquery1+=", c.value value3"
subquery1+=" from ${dir}/${a1} a join ${dir}/${b1} b on a.Identifier=b.Identifier and a.Quarter=b.Quarter"
subquery1+=" join ${dir}/${c1} c on a.Identifier=c.Identifier and a.Quarter=c.Quarter"
#echo $subquery1

q -H -T -t -O "${subquery1}" > ratio/ratio3.tsv


a1="Operating_Income.csv"
b1="Total_Debt.csv"
subquery1="select a.Identifier ticker, a.CompanyName company, a.Country country, a.SectorName sector"
subquery1+=", ${yearQuery} "
subquery1+=", ${quarterQuery} "
subquery1+=", 1.0*a.value/b.value ratio"
subquery1+=", a.value value1"
subquery1+=", b.value value2"
subquery1+=" from ${dir}/${a1} a join ${dir}/${b1} b on a.Identifier=b.Identifier and a.Quarter=b.Quarter"
#echo $subquery1

q -H -T -t -O "${subquery1}" > ratio/ratio4.tsv



a1="Operating_Income.csv"
b1="Total_Long_Term_Debt.csv"
subquery1="select a.Identifier ticker, a.CompanyName company, a.Country country, a.SectorName sector"
subquery1+=", ${yearQuery} "
subquery1+=", ${quarterQuery} "
subquery1+=", 1.0*a.value/b.value ratio"
subquery1+=", a.value value1"
subquery1+=", b.value value2"
subquery1+=" from ${dir}/${a1} a join ${dir}/${b1} b on a.Identifier=b.Identifier and a.Quarter=b.Quarter"
#echo $subquery1

q -H -T -t -O "${subquery1}" > ratio/ratio5.tsv



a1="Operating_Income.csv"
b1="Total_Debt.csv"
c1="Total_Long_Term_Debt.csv"
subquery1="select a.Identifier ticker, a.CompanyName company, a.Country country, a.SectorName sector"
subquery1+=", ${yearQuery} "
subquery1+=", ${quarterQuery} "
subquery1+=", 1.0*a.value/(b.value-c.value) ratio"
subquery1+=", a.value value1"
subquery1+=", b.value value2"
subquery1+=", c.value value3"
subquery1+=" from ${dir}/${a1} a join ${dir}/${b1} b on a.Identifier=b.Identifier and a.Quarter=b.Quarter"
subquery1+=" join ${dir}/${c1} c on a.Identifier=c.Identifier and a.Quarter=c.Quarter"
#echo $subquery1

q -H -T -t -O "${subquery1}" > ratio/ratio6.tsv



a1="Total_Debt.csv"
b1="Total_Equity.csv"
subquery1="select a.Identifier ticker, a.CompanyName company, a.Country country, a.SectorName sector"
subquery1+=", ${yearQuery} "
subquery1+=", ${quarterQuery} "
subquery1+=", 1.0*a.value/b.value ratio"
subquery1+=", a.value value1"
subquery1+=", b.value value2"
subquery1+=" from ${dir}/${a1} a join ${dir}/${b1} b on a.Identifier=b.Identifier and a.Quarter=b.Quarter"
#echo $subquery1

q -H -T -t -O "${subquery1}" > ratio/ratio7.tsv



a1="Total_Debt.csv"
b1="Total_Equity.csv"
subquery1="select a.Identifier ticker, a.CompanyName company, a.Country country, a.SectorName sector"
subquery1+=", ${yearQuery} "
subquery1+=", ${quarterQuery} "
subquery1+=", 1.0*(a.value+b.value)/b.value ratio"
subquery1+=", a.value value1"
subquery1+=", b.value value2"
subquery1+=" from ${dir}/${a1} a join ${dir}/${b1} b on a.Identifier=b.Identifier and a.Quarter=b.Quarter"
#echo $subquery1

q -H -T -t -O "${subquery1}" > ratio/ratio8.tsv



a1="Net_Sales.csv"
b1="Total_Debt.csv"
c1="Total_Equity.csv"
subquery1="select a.Identifier ticker, a.CompanyName company, a.Country country, a.SectorName sector"
subquery1+=", ${yearQuery} "
subquery1+=", ${quarterQuery} "
subquery1+=", 1.0*a.value/(b.value+c.value) ratio"
subquery1+=", a.value value1"
subquery1+=", b.value value2"
subquery1+=", c.value value3"
subquery1+=" from ${dir}/${a1} a join ${dir}/${b1} b on a.Identifier=b.Identifier and a.Quarter=b.Quarter"
subquery1+=" join ${dir}/${c1} c on a.Identifier=c.Identifier and a.Quarter=c.Quarter"
#echo $subquery1

q -H -T -t -O "${subquery1}" > ratio/ratio9.tsv

a1="Operating_Income.csv"
b1="Total_Equity.csv"
subquery1="select a.Identifier ticker, a.CompanyName company, a.Country country, a.SectorName sector"
subquery1+=", ${yearQuery} "
subquery1+=", ${quarterQuery} "
subquery1+=", 1.0*(a.value+b.value)/b.value ratio"
subquery1+=", a.value value1"
subquery1+=", b.value value2"
subquery1+=" from ${dir}/${a1} a join ${dir}/${b1} b on a.Identifier=b.Identifier and a.Quarter=b.Quarter"
#echo $subquery1

q -H -T -t -O "${subquery1}" > ratio/ratio10.tsv








