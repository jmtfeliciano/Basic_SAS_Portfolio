/* 	
	Homework 1 
	By: Josemari Feliciano
	Net ID: jtf44  
*/



*creates a path (short cut) to locate folder and files;
%let pathname=C:\Users\seri\Desktop\advancedprogramming\assignment1\;

/*	 for question 1:  creates temporary dataset called employment using data extracted from employment.txt file.	
		this section also labels my variables with the variable names prescribed in the homework    */ 
data employment;
	infile "&pathname.employment.txt" missover;
	*below extracts data based on the info prescribed in the homework handout;
	input @1 name $char17. @20 d_began MMDDYY10. @36 s_sal comma7. @43 d_ended MMDDYY8. @58 e_sal comma7. /
		@1 marital $8. @16 sex $ /
		@7 dob MMDDYY10. ; 
	*below labels the data for clarify when printing;
	label name = 'Name'
		d_began = 'Date Employment Began'
		s_sal = 'Starting Salary'
		d_ended = 'Date Employment Ended'
		e_sal = 'Ending Salary'
		marital = 'Marital Status'
		sex = 'Sex'
		dob = 'Date of Birth';
	/* 	below formats: 1. dates into desired formatting based on homework prompt 2. salary to include comma 
	 	note to self:  pg 90-91 of SAS book useful for master list of date formatting */
	format d_began worddate18. d_ended worddate18. dob MMDDYY10. s_sal comma7. e_sal comma7.;
run;

*for question 1:  prints first 5 dataset;
TITLE 'First 5 Data Set from Employment Data';

proc print data=employment (obs = 5) label; 
run;
TITLE;

*for question 1:  shows contents of dataset;
proc contents data=employment;
run;



*for question 2:  subset male from employment data then print;

*subsets previous dataset into data called 'male' then deletes if they're female or has no assigned gender;
data male; set employment;
	if sex = 'F' then delete;
		else if sex = '' then delete;
run;

*print subset data called male;
TITLE 'Data of All Male Employees';
proc print data=male label; 
run; 
TITLE;


*subsets previous dataset into new data called 'underpaid'--not underpaid if makes/made $40000 or higher;
data underpaid; set employment;
	/* logic of if-else below:  
		if no data, delete. if new employee and makes 40,000 or higher, delete. 
		if already left and made 40000 or higher for last salary, delete */
	if s_sal = . & e_sal = . then delete;
		else if (e_sal = . & s_sal >= 40000) then delete;
		else if e_sal >= 40000 then delete;
run;

/* print subset data called underpaid */
TITLE 'Data of All Underpaid Employees';
proc print data=underpaid label; 
run; 
TITLE;










