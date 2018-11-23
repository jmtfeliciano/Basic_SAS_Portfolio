/* 
	- simply the formats I will use for my main file
	- uses the provided documentation given to us for the homework to produce labels
*/

proc format library=work.hw6format;

value gender_format 
	0="Female" 1="Male";
value race_format
	0="White" 1="Black" 2="Asian" 3="Native American" 4="Pacific Islander" 5="Unknown";
value marital_format
	1="Married" 2="Divorced" 3="Separated" 4="Widowed" 5="Single" 6="Other";
value a1dx_format
	0="No" 1="Yes";
value income_format
	1="<20,000" 2="20,000 to <40,000" 3="40,000 to <80,000" 
	4="80,000 to 120,000" 5="> 120,000" 6="Refuse to Respond" 7="Missing";
run;
