//SAH and severity by season

//NEWYORK
use "\\HSR-LINK\1MAP Databases\Databases\HCUP SID\New York/Origin Files/ NY Master File 2009 to 2013.dta", clear

gen SUMMER = 0 
replace SUMMER = 1 if AMONTH == 6 | AMONTH == 7 | AMONTH == 8

gen SPRING = 0
replace SPRING = 1 if AMONTH == 3 | AMONTH==4 | AMONTH == 5

gen FALL = 0
replace FALL = 1 if AMONTH == 9 | AMONTH == 10 | AMONTH == 11

gen WINTER = 0
replace WINTER = 1 if AMONTH == 12 | AMONTH ==1 | AMONTH == 2

gen SAH=0
replace SAH=1 if DX1=="430"

gen PT_INT=0
replace PT_INT=1 if SAH==1 

keep if PT_INT==1

//Creating NIS-SSS based on formula from ANALYSIS of SAH in NIS C.W. Washington et. al
gen VENT=0
foreach var of varlist PR1-PR14 {
	replace VENT=1 if `var' == "9604" | `var'== "967" | `var' == "9671" | `var' == "9672"
}

gen HCP=1
foreach var of varlist DX1-DX20 {
	replace HCP=1 if `var' == "3313" | `var' == "3314"
}
gen HCP_TRT=0
foreach var of varlist PR1-PR14 {
	replace HCP=1 if `var' == "022" | `var' == "0231" | `var' == "0232" | `var' == "0233" |`var' == "0234" |`var' == "0235" |`var' == "0236" | `var' == "0237" | `var' == "0238" | `var' == "0239" 
}
gen COMA=0
foreach var of varlist DX1-DX20 {
	replace COMA=1 if `var' == "78001" | `var' == "78003"
}
gen CNPALSY=0
foreach var of varlist DX1-DX20 {
	replace CNPALSY=1 if `var'=="3785" | `var'=="37851" | `var'=="37852" | `var'=="37853" | `var'=="37854" | `var'=="37855" | `var'=="37856" |  `var'=="37940" | `var'=="37941" | `var'=="37942" | `var'=="37943"
}
gen PRLYSIS=0
foreach var of varlist DX1-DX20 {
	replace PRLYSIS=1 if `var' == "4382" | `var' == "43821" | `var' == "43822" | `var' == "43823" | `var' == "43824" | `var' == "43825" | `var' == "43826" | `var' == "43827" | `var' == "43828" | `var' == "43829" | `var' == "4383" | `var' == "43831" | `var' == "43832" | `var' == "43833" | `var' == "43834" | `var' == "43835" | `var' == "43836" | `var' == "43837" | `var' == "43838" | `var' == "43839" | `var' == "4384" | `var' == "43841" |`var' == "43842" |`var' == "43843" |`var' == "43844" |`var' == "43845" |`var' == "43846" |`var' == "43847" |`var' == "43848" |`var' == "43849" |`var' == "4385" | `var' == "43851" |`var' == "43852" |`var' == "43853" | `var' == "7814" 
}

gen APHASIA=0
foreach var of varlist DX1-DX20 {
	replace APHASIA=1 if `var'=="4381" | `var'=="43811" | `var'=="43812" |`var'=="43813" |`var'=="43814" |`var'=="43815" 
	replace APHASIA=1 if `var'=="43816" |`var'=="43817" |`var'=="43818" |`var'=="43819" 
	replace APHASIA=1 if `var' == "43811" |`var' == "43812" |`var' == "43813" |`var' == "43814" |`var' == "43815" |`var' == "43816" |`var' == "43817"
	replace APHASIA=1 if `var' == "43818" |`var' == "43819" |`var' == "4382" | |`var' == "43821" |`var' == "43822" |`var' == "43823" |`var' == "43824" |`var' == "43825"
	replace APHASIA=1 if `var' == "43826" |`var' == "43827" |`var' == "43828" |`var' == "43829" |`var' == "43830" | `var' == "43831" |`var' == "43832" |`var' == "43833"
	replace APHASIA=1 if `var' == "43834" |`var' == "43835" |`var' == "43836" |`var' == "43837" |`var' == "43838" |`var' == "43839" |`var' == "4384" | `var' == "43841" |`var' == "43842"
	replace APHASIA=1 if `var' == "43843" |`var' == "43844" |`var' == "43845" |`var' == "43846" |`var' == "43847" |`var' == "43848" |`var' == "43849" |`var' == "4385" | `var' == "43851" 
	replace APHASIA=1 if `var' == "43852" |`var' == "43853" |`var' == "43854" |`var' == "43855" |`var' == "43856" |`var' == "43857" |`var' == "43858" |`var' == "43859" |`var' == "4386"
	replace APHASIA=1 if `var' == "43861" |`var' == "43862" |`var' == "43863" |`var' == "43864" |`var' == "43865" |`var' == "43866" |`var' == "43867" |`var' == "43868" |`var' == "43869"
	replace APHASIA=1 if `var' == "4387" | `var' == "43871" |`var' == "43872" |`var' == "43873" |`var' == "43874" |`var' == "43875" |`var' == "43876" |`var' == "43877" |`var' == "43878"
	replace APHASIA=1 if `var' == "43879" |`var' == "4388" | `var' == "43881" |`var' == "43882" |`var' == "43883" |`var' == "43884" |`var' == "43885" |`var' == "43886" |`var' == "43887"
	replace APHASIA=1 if `var' == "43888" |`var' == "43889"
}

***repeat for each state
***
***
***

/* California */

use "\\HSR-LINK\1MAP Databases\Databases\HCUP SID\CALIFORNIA\Origin Files\HCUP SID CA MASTER 2006 to 2011.dta", clear

gen SUMMER = 0 
replace SUMMER = 1 if AMONTH == 6 | AMONTH == 7 | AMONTH == 8

gen SPRING = 0
replace SPRING = 1 if AMONTH == 3 | AMONTH==4 | AMONTH == 5

gen FALL = 0
replace FALL = 1 if AMONTH == 9 | AMONTH == 10 | AMONTH == 11

gen WINTER = 0
replace WINTER = 1 if AMONTH == 12 | AMONTH ==1 | AMONTH == 2

gen SAH=0
replace SAH=1 if DX1=="430"

gen PT_INT=0
replace PT_INT=1 if SAH==1 

keep if PT_INT==1

//Creating NIS-SSS based on formula from ANALYSIS of SAH in NIS C.W. Washington et. al
gen VENT=0
foreach var of varlist PR1-PR14 {
	replace VENT=1 if `var' == "9604" | `var'== "967" | `var' == "9671" | `var' == "9672"
}

gen HCP=1
foreach var of varlist DX1-DX20 {
	replace HCP=1 if `var' == "3313" | `var' == "3314"
}
gen HCP_TRT=0
foreach var of varlist PR1-PR14 {
	replace HCP=1 if `var' == "022" | `var' == "0231" | `var' == "0232" | `var' == "0233" |`var' == "0234" |`var' == "0235" |`var' == "0236" | `var' == "0237" | `var' == "0238" | `var' == "0239" 
}
gen COMA=0
foreach var of varlist DX1-DX20 {
	replace COMA=1 if `var' == "78001" | `var' == "78003"
}
gen CNPALSY=0
foreach var of varlist DX1-DX20 {
	replace CNPALSY=1 if `var'=="3785" | `var'=="37851" | `var'=="37852" | `var'=="37853" | `var'=="37854" | `var'=="37855" | `var'=="37856" |  `var'=="37940" | `var'=="37941" | `var'=="37942" | `var'=="37943"
}
gen PRLYSIS=0
foreach var of varlist DX1-DX20 {
	replace PRLYSIS=1 if `var' == "4382" | `var' == "43821" | `var' == "43822" | `var' == "43823" | `var' == "43824" | `var' == "43825" | `var' == "43826" | `var' == "43827" | `var' == "43828" | `var' == "43829" | `var' == "4383" | `var' == "43831" | `var' == "43832" | `var' == "43833" | `var' == "43834" | `var' == "43835" | `var' == "43836" | `var' == "43837" | `var' == "43838" | `var' == "43839" | `var' == "4384" | `var' == "43841" |`var' == "43842" |`var' == "43843" |`var' == "43844" |`var' == "43845" |`var' == "43846" |`var' == "43847" |`var' == "43848" |`var' == "43849" |`var' == "4385" | `var' == "43851" |`var' == "43852" |`var' == "43853" | `var' == "7814" 
}

gen APHASIA=0
foreach var of varlist DX1-DX20 {
	replace APHASIA=1 if `var'=="4381" | `var'=="43811" | `var'=="43812" |`var'=="43813" |`var'=="43814" |`var'=="43815" 
	replace APHASIA=1 if `var'=="43816" |`var'=="43817" |`var'=="43818" |`var'=="43819" 
	replace APHASIA=1 if `var' == "43811" |`var' == "43812" |`var' == "43813" |`var' == "43814" |`var' == "43815" |`var' == "43816" |`var' == "43817"
	replace APHASIA=1 if `var' == "43818" |`var' == "43819" |`var' == "4382" | |`var' == "43821" |`var' == "43822" |`var' == "43823" |`var' == "43824" |`var' == "43825"
	replace APHASIA=1 if `var' == "43826" |`var' == "43827" |`var' == "43828" |`var' == "43829" |`var' == "43830" | `var' == "43831" |`var' == "43832" |`var' == "43833"
	replace APHASIA=1 if `var' == "43834" |`var' == "43835" |`var' == "43836" |`var' == "43837" |`var' == "43838" |`var' == "43839" |`var' == "4384" | `var' == "43841" |`var' == "43842"
	replace APHASIA=1 if `var' == "43843" |`var' == "43844" |`var' == "43845" |`var' == "43846" |`var' == "43847" |`var' == "43848" |`var' == "43849" |`var' == "4385" | `var' == "43851" 
	replace APHASIA=1 if `var' == "43852" |`var' == "43853" |`var' == "43854" |`var' == "43855" |`var' == "43856" |`var' == "43857" |`var' == "43858" |`var' == "43859" |`var' == "4386"
	replace APHASIA=1 if `var' == "43861" |`var' == "43862" |`var' == "43863" |`var' == "43864" |`var' == "43865" |`var' == "43866" |`var' == "43867" |`var' == "43868" |`var' == "43869"
	replace APHASIA=1 if `var' == "4387" | `var' == "43871" |`var' == "43872" |`var' == "43873" |`var' == "43874" |`var' == "43875" |`var' == "43876" |`var' == "43877" |`var' == "43878"
	replace APHASIA=1 if `var' == "43879" |`var' == "4388" | `var' == "43881" |`var' == "43882" |`var' == "43883" |`var' == "43884" |`var' == "43885" |`var' == "43886" |`var' == "43887"
	replace APHASIA=1 if `var' == "43888" |`var' == "43889"
}

***
***
***

/*Florida 2009-2013*/  use "\\HSR-LINK\1MAP Databases\Databases\HCUP SID\FLORIDA\Origin Files\FLORIDA MASTER 2009 to 2013.dta", clear

gen SUMMER = 0 
replace SUMMER = 1 if AMONTH == 6 | AMONTH == 7 | AMONTH == 8

gen SPRING = 0
replace SPRING = 1 if AMONTH == 3 | AMONTH==4 | AMONTH == 5

gen FALL = 0
replace FALL = 1 if AMONTH == 9 | AMONTH == 10 | AMONTH == 11

gen WINTER = 0
replace WINTER = 1 if AMONTH == 12 | AMONTH ==1 | AMONTH == 2

gen SAH=0
replace SAH=1 if DX1=="430"

gen PT_INT=0
replace PT_INT=1 if SAH==1 

keep if PT_INT==1

//Creating NIS-SSS based on formula from ANALYSIS of SAH in NIS C.W. Washington et. al
gen VENT=0
foreach var of varlist PR1-PR14 {
	replace VENT=1 if `var' == "9604" | `var'== "967" | `var' == "9671" | `var' == "9672"
}

gen HCP=1
foreach var of varlist DX1-DX20 {
	replace HCP=1 if `var' == "3313" | `var' == "3314"
}
gen HCP_TRT=0
foreach var of varlist PR1-PR14 {
	replace HCP=1 if `var' == "022" | `var' == "0231" | `var' == "0232" | `var' == "0233" |`var' == "0234" |`var' == "0235" |`var' == "0236" | `var' == "0237" | `var' == "0238" | `var' == "0239" 
}
gen COMA=0
foreach var of varlist DX1-DX20 {
	replace COMA=1 if `var' == "78001" | `var' == "78003"
}
gen CNPALSY=0
foreach var of varlist DX1-DX20 {
	replace CNPALSY=1 if `var'=="3785" | `var'=="37851" | `var'=="37852" | `var'=="37853" | `var'=="37854" | `var'=="37855" | `var'=="37856" |  `var'=="37940" | `var'=="37941" | `var'=="37942" | `var'=="37943"
}
gen PRLYSIS=0
foreach var of varlist DX1-DX20 {
	replace PRLYSIS=1 if `var' == "4382" | `var' == "43821" | `var' == "43822" | `var' == "43823" | `var' == "43824" | `var' == "43825" | `var' == "43826" | `var' == "43827" | `var' == "43828" | `var' == "43829" | `var' == "4383" | `var' == "43831" | `var' == "43832" | `var' == "43833" | `var' == "43834" | `var' == "43835" | `var' == "43836" | `var' == "43837" | `var' == "43838" | `var' == "43839" | `var' == "4384" | `var' == "43841" |`var' == "43842" |`var' == "43843" |`var' == "43844" |`var' == "43845" |`var' == "43846" |`var' == "43847" |`var' == "43848" |`var' == "43849" |`var' == "4385" | `var' == "43851" |`var' == "43852" |`var' == "43853" | `var' == "7814" 
}

gen APHASIA=0
foreach var of varlist DX1-DX20 {
	replace APHASIA=1 if `var'=="4381" | `var'=="43811" | `var'=="43812" |`var'=="43813" |`var'=="43814" |`var'=="43815" 
	replace APHASIA=1 if `var'=="43816" |`var'=="43817" |`var'=="43818" |`var'=="43819" 
	replace APHASIA=1 if `var' == "43811" |`var' == "43812" |`var' == "43813" |`var' == "43814" |`var' == "43815" |`var' == "43816" |`var' == "43817"
	replace APHASIA=1 if `var' == "43818" |`var' == "43819" |`var' == "4382" | |`var' == "43821" |`var' == "43822" |`var' == "43823" |`var' == "43824" |`var' == "43825"
	replace APHASIA=1 if `var' == "43826" |`var' == "43827" |`var' == "43828" |`var' == "43829" |`var' == "43830" | `var' == "43831" |`var' == "43832" |`var' == "43833"
	replace APHASIA=1 if `var' == "43834" |`var' == "43835" |`var' == "43836" |`var' == "43837" |`var' == "43838" |`var' == "43839" |`var' == "4384" | `var' == "43841" |`var' == "43842"
	replace APHASIA=1 if `var' == "43843" |`var' == "43844" |`var' == "43845" |`var' == "43846" |`var' == "43847" |`var' == "43848" |`var' == "43849" |`var' == "4385" | `var' == "43851" 
	replace APHASIA=1 if `var' == "43852" |`var' == "43853" |`var' == "43854" |`var' == "43855" |`var' == "43856" |`var' == "43857" |`var' == "43858" |`var' == "43859" |`var' == "4386"
	replace APHASIA=1 if `var' == "43861" |`var' == "43862" |`var' == "43863" |`var' == "43864" |`var' == "43865" |`var' == "43866" |`var' == "43867" |`var' == "43868" |`var' == "43869"
	replace APHASIA=1 if `var' == "4387" | `var' == "43871" |`var' == "43872" |`var' == "43873" |`var' == "43874" |`var' == "43875" |`var' == "43876" |`var' == "43877" |`var' == "43878"
	replace APHASIA=1 if `var' == "43879" |`var' == "4388" | `var' == "43881" |`var' == "43882" |`var' == "43883" |`var' == "43884" |`var' == "43885" |`var' == "43886" |`var' == "43887"
	replace APHASIA=1 if `var' == "43888" |`var' == "43889"
}

/*
IA 
*/
use "\\HSR-LINK\1MAP Databases\Databases\HCUP SID\Iowa\Origin File\IA Master File 2009 to 2013.dta", clear

gen SUMMER = 0 
replace SUMMER = 1 if AMONTH == 6 | AMONTH == 7 | AMONTH == 8

gen SPRING = 0
replace SPRING = 1 if AMONTH == 3 | AMONTH==4 | AMONTH == 5

gen FALL = 0
replace FALL = 1 if AMONTH == 9 | AMONTH == 10 | AMONTH == 11

gen WINTER = 0
replace WINTER = 1 if AMONTH == 12 | AMONTH ==1 | AMONTH == 2

gen SAH=0
replace SAH=1 if DX1=="430"

gen PT_INT=0
replace PT_INT=1 if SAH==1 

keep if PT_INT==1

//Creating NIS-SSS based on formula from ANALYSIS of SAH in NIS C.W. Washington et. al
gen VENT=0
foreach var of varlist PR1-PR14 {
	replace VENT=1 if `var' == "9604" | `var'== "967" | `var' == "9671" | `var' == "9672"
}

gen HCP=1
foreach var of varlist DX1-DX20 {
	replace HCP=1 if `var' == "3313" | `var' == "3314"
}
gen HCP_TRT=0
foreach var of varlist PR1-PR14 {
	replace HCP=1 if `var' == "022" | `var' == "0231" | `var' == "0232" | `var' == "0233" |`var' == "0234" |`var' == "0235" |`var' == "0236" | `var' == "0237" | `var' == "0238" | `var' == "0239" 
}
gen COMA=0
foreach var of varlist DX1-DX20 {
	replace COMA=1 if `var' == "78001" | `var' == "78003"
}
gen CNPALSY=0
foreach var of varlist DX1-DX20 {
	replace CNPALSY=1 if `var'=="3785" | `var'=="37851" | `var'=="37852" | `var'=="37853" | `var'=="37854" | `var'=="37855" | `var'=="37856" |  `var'=="37940" | `var'=="37941" | `var'=="37942" | `var'=="37943"
}
gen PRLYSIS=0
foreach var of varlist DX1-DX20 {
	replace PRLYSIS=1 if `var' == "4382" | `var' == "43821" | `var' == "43822" | `var' == "43823" | `var' == "43824" | `var' == "43825" | `var' == "43826" | `var' == "43827" | `var' == "43828" | `var' == "43829" | `var' == "4383" | `var' == "43831" | `var' == "43832" | `var' == "43833" | `var' == "43834" | `var' == "43835" | `var' == "43836" | `var' == "43837" | `var' == "43838" | `var' == "43839" | `var' == "4384" | `var' == "43841" |`var' == "43842" |`var' == "43843" |`var' == "43844" |`var' == "43845" |`var' == "43846" |`var' == "43847" |`var' == "43848" |`var' == "43849" |`var' == "4385" | `var' == "43851" |`var' == "43852" |`var' == "43853" | `var' == "7814" 
}

gen APHASIA=0
foreach var of varlist DX1-DX20 {
	replace APHASIA=1 if `var'=="4381" | `var'=="43811" | `var'=="43812" |`var'=="43813" |`var'=="43814" |`var'=="43815" 
	replace APHASIA=1 if `var'=="43816" |`var'=="43817" |`var'=="43818" |`var'=="43819" 
	replace APHASIA=1 if `var' == "43811" |`var' == "43812" |`var' == "43813" |`var' == "43814" |`var' == "43815" |`var' == "43816" |`var' == "43817"
	replace APHASIA=1 if `var' == "43818" |`var' == "43819" |`var' == "4382" | |`var' == "43821" |`var' == "43822" |`var' == "43823" |`var' == "43824" |`var' == "43825"
	replace APHASIA=1 if `var' == "43826" |`var' == "43827" |`var' == "43828" |`var' == "43829" |`var' == "43830" | `var' == "43831" |`var' == "43832" |`var' == "43833"
	replace APHASIA=1 if `var' == "43834" |`var' == "43835" |`var' == "43836" |`var' == "43837" |`var' == "43838" |`var' == "43839" |`var' == "4384" | `var' == "43841" |`var' == "43842"
	replace APHASIA=1 if `var' == "43843" |`var' == "43844" |`var' == "43845" |`var' == "43846" |`var' == "43847" |`var' == "43848" |`var' == "43849" |`var' == "4385" | `var' == "43851" 
	replace APHASIA=1 if `var' == "43852" |`var' == "43853" |`var' == "43854" |`var' == "43855" |`var' == "43856" |`var' == "43857" |`var' == "43858" |`var' == "43859" |`var' == "4386"
	replace APHASIA=1 if `var' == "43861" |`var' == "43862" |`var' == "43863" |`var' == "43864" |`var' == "43865" |`var' == "43866" |`var' == "43867" |`var' == "43868" |`var' == "43869"
	replace APHASIA=1 if `var' == "4387" | `var' == "43871" |`var' == "43872" |`var' == "43873" |`var' == "43874" |`var' == "43875" |`var' == "43876" |`var' == "43877" |`var' == "43878"
	replace APHASIA=1 if `var' == "43879" |`var' == "4388" | `var' == "43881" |`var' == "43882" |`var' == "43883" |`var' == "43884" |`var' == "43885" |`var' == "43886" |`var' == "43887"
	replace APHASIA=1 if `var' == "43888" |`var' == "43889"
}

***
***
***
/*NY*/
use "\\HSR-LINK\1MAP Databases\Databases\HCUP SID\New York\Origin Files\NY Master File 2009 to 2013.dta", clear

gen SUMMER = 0 
replace SUMMER = 1 if AMONTH == 6 | AMONTH == 7 | AMONTH == 8

gen SPRING = 0
replace SPRING = 1 if AMONTH == 3 | AMONTH==4 | AMONTH == 5

gen FALL = 0
replace FALL = 1 if AMONTH == 9 | AMONTH == 10 | AMONTH == 11

gen WINTER = 0
replace WINTER = 1 if AMONTH == 12 | AMONTH ==1 | AMONTH == 2

gen SAH=0
replace SAH=1 if DX1=="430"

gen PT_INT=0
replace PT_INT=1 if SAH==1 

keep if PT_INT==1

//Creating NIS-SSS based on formula from ANALYSIS of SAH in NIS C.W. Washington et. al
gen VENT=0
foreach var of varlist PR1-PR14 {
	replace VENT=1 if `var' == "9604" | `var'== "967" | `var' == "9671" | `var' == "9672"
}

gen HCP=1
foreach var of varlist DX1-DX20 {
	replace HCP=1 if `var' == "3313" | `var' == "3314"
}
gen HCP_TRT=0
foreach var of varlist PR1-PR14 {
	replace HCP=1 if `var' == "022" | `var' == "0231" | `var' == "0232" | `var' == "0233" |`var' == "0234" |`var' == "0235" |`var' == "0236" | `var' == "0237" | `var' == "0238" | `var' == "0239" 
}
gen COMA=0
foreach var of varlist DX1-DX20 {
	replace COMA=1 if `var' == "78001" | `var' == "78003"
}
gen CNPALSY=0
foreach var of varlist DX1-DX20 {
	replace CNPALSY=1 if `var'=="3785" | `var'=="37851" | `var'=="37852" | `var'=="37853" | `var'=="37854" | `var'=="37855" | `var'=="37856" |  `var'=="37940" | `var'=="37941" | `var'=="37942" | `var'=="37943"
}
gen PRLYSIS=0
foreach var of varlist DX1-DX20 {
	replace PRLYSIS=1 if `var' == "4382" | `var' == "43821" | `var' == "43822" | `var' == "43823" | `var' == "43824" | `var' == "43825" | `var' == "43826" | `var' == "43827" | `var' == "43828" | `var' == "43829" | `var' == "4383" | `var' == "43831" | `var' == "43832" | `var' == "43833" | `var' == "43834" | `var' == "43835" | `var' == "43836" | `var' == "43837" | `var' == "43838" | `var' == "43839" | `var' == "4384" | `var' == "43841" |`var' == "43842" |`var' == "43843" |`var' == "43844" |`var' == "43845" |`var' == "43846" |`var' == "43847" |`var' == "43848" |`var' == "43849" |`var' == "4385" | `var' == "43851" |`var' == "43852" |`var' == "43853" | `var' == "7814" 
}

gen APHASIA=0
foreach var of varlist DX1-DX20 {
	replace APHASIA=1 if `var'=="4381" | `var'=="43811" | `var'=="43812" |`var'=="43813" |`var'=="43814" |`var'=="43815" 
	replace APHASIA=1 if `var'=="43816" |`var'=="43817" |`var'=="43818" |`var'=="43819" 
	replace APHASIA=1 if `var' == "43811" |`var' == "43812" |`var' == "43813" |`var' == "43814" |`var' == "43815" |`var' == "43816" |`var' == "43817"
	replace APHASIA=1 if `var' == "43818" |`var' == "43819" |`var' == "4382" | |`var' == "43821" |`var' == "43822" |`var' == "43823" |`var' == "43824" |`var' == "43825"
	replace APHASIA=1 if `var' == "43826" |`var' == "43827" |`var' == "43828" |`var' == "43829" |`var' == "43830" | `var' == "43831" |`var' == "43832" |`var' == "43833"
	replace APHASIA=1 if `var' == "43834" |`var' == "43835" |`var' == "43836" |`var' == "43837" |`var' == "43838" |`var' == "43839" |`var' == "4384" | `var' == "43841" |`var' == "43842"
	replace APHASIA=1 if `var' == "43843" |`var' == "43844" |`var' == "43845" |`var' == "43846" |`var' == "43847" |`var' == "43848" |`var' == "43849" |`var' == "4385" | `var' == "43851" 
	replace APHASIA=1 if `var' == "43852" |`var' == "43853" |`var' == "43854" |`var' == "43855" |`var' == "43856" |`var' == "43857" |`var' == "43858" |`var' == "43859" |`var' == "4386"
	replace APHASIA=1 if `var' == "43861" |`var' == "43862" |`var' == "43863" |`var' == "43864" |`var' == "43865" |`var' == "43866" |`var' == "43867" |`var' == "43868" |`var' == "43869"
	replace APHASIA=1 if `var' == "4387" | `var' == "43871" |`var' == "43872" |`var' == "43873" |`var' == "43874" |`var' == "43875" |`var' == "43876" |`var' == "43877" |`var' == "43878"
	replace APHASIA=1 if `var' == "43879" |`var' == "4388" | `var' == "43881" |`var' == "43882" |`var' == "43883" |`var' == "43884" |`var' == "43885" |`var' == "43886" |`var' == "43887"
	replace APHASIA=1 if `var' == "43888" |`var' == "43889"
}

***
***
***
/*WA*/
use "\\HSR-LINK\1MAP Databases\Databases\HCUP SID\Washington\Origin File\WA Master File 2009 to 2013.dta", clear
gen SUMMER = 0 
replace SUMMER = 1 if AMONTH == 6 | AMONTH == 7 | AMONTH == 8

gen SPRING = 0
replace SPRING = 1 if AMONTH == 3 | AMONTH==4 | AMONTH == 5

gen FALL = 0
replace FALL = 1 if AMONTH == 9 | AMONTH == 10 | AMONTH == 11

gen WINTER = 0
replace WINTER = 1 if AMONTH == 12 | AMONTH ==1 | AMONTH == 2

gen SAH=0
replace SAH=1 if DX1=="430"

gen PT_INT=0
replace PT_INT=1 if SAH==1 

keep if PT_INT==1

//Creating NIS-SSS based on formula from ANALYSIS of SAH in NIS C.W. Washington et. al
gen VENT=0
foreach var of varlist PR1-PR14 {
	replace VENT=1 if `var' == "9604" | `var'== "967" | `var' == "9671" | `var' == "9672"
}

gen HCP=1
foreach var of varlist DX1-DX20 {
	replace HCP=1 if `var' == "3313" | `var' == "3314"
}
gen HCP_TRT=0
foreach var of varlist PR1-PR14 {
	replace HCP=1 if `var' == "022" | `var' == "0231" | `var' == "0232" | `var' == "0233" |`var' == "0234" |`var' == "0235" |`var' == "0236" | `var' == "0237" | `var' == "0238" | `var' == "0239" 
}
gen COMA=0
foreach var of varlist DX1-DX20 {
	replace COMA=1 if `var' == "78001" | `var' == "78003"
}
gen CNPALSY=0
foreach var of varlist DX1-DX20 {
	replace CNPALSY=1 if `var'=="3785" | `var'=="37851" | `var'=="37852" | `var'=="37853" | `var'=="37854" | `var'=="37855" | `var'=="37856" |  `var'=="37940" | `var'=="37941" | `var'=="37942" | `var'=="37943"
}
gen PRLYSIS=0
foreach var of varlist DX1-DX20 {
	replace PRLYSIS=1 if `var' == "4382" | `var' == "43821" | `var' == "43822" | `var' == "43823" | `var' == "43824" | `var' == "43825" | `var' == "43826" | `var' == "43827" | `var' == "43828" | `var' == "43829" | `var' == "4383" | `var' == "43831" | `var' == "43832" | `var' == "43833" | `var' == "43834" | `var' == "43835" | `var' == "43836" | `var' == "43837" | `var' == "43838" | `var' == "43839" | `var' == "4384" | `var' == "43841" |`var' == "43842" |`var' == "43843" |`var' == "43844" |`var' == "43845" |`var' == "43846" |`var' == "43847" |`var' == "43848" |`var' == "43849" |`var' == "4385" | `var' == "43851" |`var' == "43852" |`var' == "43853" | `var' == "7814" 
}

gen APHASIA=0
foreach var of varlist DX1-DX20 {
	replace APHASIA=1 if `var'=="4381" | `var'=="43811" | `var'=="43812" |`var'=="43813" |`var'=="43814" |`var'=="43815" 
	replace APHASIA=1 if `var'=="43816" |`var'=="43817" |`var'=="43818" |`var'=="43819" 
	replace APHASIA=1 if `var' == "43811" |`var' == "43812" |`var' == "43813" |`var' == "43814" |`var' == "43815" |`var' == "43816" |`var' == "43817"
	replace APHASIA=1 if `var' == "43818" |`var' == "43819" |`var' == "4382" | |`var' == "43821" |`var' == "43822" |`var' == "43823" |`var' == "43824" |`var' == "43825"
	replace APHASIA=1 if `var' == "43826" |`var' == "43827" |`var' == "43828" |`var' == "43829" |`var' == "43830" | `var' == "43831" |`var' == "43832" |`var' == "43833"
	replace APHASIA=1 if `var' == "43834" |`var' == "43835" |`var' == "43836" |`var' == "43837" |`var' == "43838" |`var' == "43839" |`var' == "4384" | `var' == "43841" |`var' == "43842"
	replace APHASIA=1 if `var' == "43843" |`var' == "43844" |`var' == "43845" |`var' == "43846" |`var' == "43847" |`var' == "43848" |`var' == "43849" |`var' == "4385" | `var' == "43851" 
	replace APHASIA=1 if `var' == "43852" |`var' == "43853" |`var' == "43854" |`var' == "43855" |`var' == "43856" |`var' == "43857" |`var' == "43858" |`var' == "43859" |`var' == "4386"
	replace APHASIA=1 if `var' == "43861" |`var' == "43862" |`var' == "43863" |`var' == "43864" |`var' == "43865" |`var' == "43866" |`var' == "43867" |`var' == "43868" |`var' == "43869"
	replace APHASIA=1 if `var' == "4387" | `var' == "43871" |`var' == "43872" |`var' == "43873" |`var' == "43874" |`var' == "43875" |`var' == "43876" |`var' == "43877" |`var' == "43878"
	replace APHASIA=1 if `var' == "43879" |`var' == "4388" | `var' == "43881" |`var' == "43882" |`var' == "43883" |`var' == "43884" |`var' == "43885" |`var' == "43886" |`var' == "43887"
	replace APHASIA=1 if `var' == "43888" |`var' == "43889"
}

//Weighted stuff 
gen VENT_WT=VENT*2.01 
gen HCP_WT=HCP*-0.07 
gen HCP_TRT_WT=HCP_TRT*0.22 
gen COMA_WT=COMA*1.77 
gen CNPALSY_WT=CNPALSY*-1.14 
gen PRLYSIS_WT=PRLYSIS*0.514 
gen APHASIA_WT=APHASIA*0.44 

gen BETA = VENT_WT + HCP_WT + HCP_TRT_WT + COMA_WT + CNPALSY_WT + PRLYSIS_WT + APHASIA_WT

gen SCORE = 0
replace SCORE = exp(BETA)
