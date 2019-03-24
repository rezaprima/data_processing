#!/bin/sh
f=$1
yearQuery="substr(a.Quarter,1,4) year"
quarterQuery="case substr(a.Quarter,6) when 'FQ0' then 4 "
quarterQuery+="when 'FQ-1' then 3 "
quarterQuery+="when 'FQ-2' then 2 "
quarterQuery+="when 'FQ-3' then 1 end quarter "
selectQuery="select Identifier, companyName, Country, SectorName"
selectQuery+=", Quarter, Value "

query="${selectQuery} from ../indonesia/${f}"
query+=" union ${selectQuery} from ../malaysia/${f}"
query+=" union ${selectQuery} from ../philippines/${f}"
query+=" union ${selectQuery} from ../singapore/${f}"
query+=" union ${selectQuery} from ../thailand/${f}"


q -HtTO "${query}" > "../${f}"