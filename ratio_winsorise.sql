select a.*
, case 
    when a.ratio1<b.ratio1_p1  then b.ratio1_p1
    when a.ratio1>b.ratio1_p99 then b.ratio1_p99
    else a.ratio1 end as ratio1_winso
, case 
    when a.ratio2<b.ratio2_p1  then b.ratio2_p1
    when a.ratio2>b.ratio2_p99 then b.ratio2_p99
    else a.ratio2 end as ratio2_winso
, case 
    when a.ratio3<b.ratio3_p1  then b.ratio3_p1
    when a.ratio3>b.ratio3_p99 then b.ratio3_p99
    else a.ratio3 end as ratio3_winso
, case 
    when a.ratio4<b.ratio4_p1  then b.ratio4_p1
    when a.ratio4>b.ratio4_p99 then b.ratio4_p99
    else a.ratio4 end as ratio4_winso
, case 
    when a.ratio5<b.ratio5_p1  then b.ratio5_p1
    when a.ratio5>b.ratio5_p99 then b.ratio5_p99
    else a.ratio5 end as ratio5_winso
, case 
    when a.ratio6<b.ratio6_p1  then b.ratio6_p1
    when a.ratio6>b.ratio6_p99 then b.ratio6_p99
    else a.ratio6 end as ratio6_winso
, case 
    when a.ratio7<b.ratio7_p1  then b.ratio7_p1
    when a.ratio7>b.ratio7_p99 then b.ratio7_p99
    else a.ratio7 end as ratio7_winso
, case 
    when a.ratio8<b.ratio8_p1  then b.ratio8_p1
    when a.ratio8>b.ratio8_p99 then b.ratio8_p99
    else a.ratio8 end as ratio8_winso
, case 
    when a.ratio9<b.ratio9_p1  then b.ratio9_p1
    when a.ratio9>b.ratio9_p99 then b.ratio9_p99
    else a.ratio9 end as ratio9_winso
, case 
    when a.ratio10<b.ratio10_p1  then b.ratio10_p1
    when a.ratio10>b.ratio10_p99 then b.ratio10_p99
    else a.ratio10 end as ratio10_winso
from data1040_redone_winsorise_hapus_clean.txt a join percentile/data1040_redone_winsorise_hapus_clean.txt b on a.NGR=b.NGR and a.QUARTER=b.QUARTER and a.YEAR=b.YEAR
