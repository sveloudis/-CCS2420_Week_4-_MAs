/*
 * Ex. 1
 */

int array[10];
local int sum = 0;


/* inline that randomly initialise ith array cell with an integer in the range [0,..,9] */
inline randinit(i) {
	/** code to use for spin versions prior to 6
	byte c;	
        do
	:: c < 9 -> c++
	:: break
	od;
	array[i] = c;
	*/

	/** 
	* code to use for spin versions 6+
	* this code translates to the above loop
	int c;
        select(c: 0..9);
        array[i] = c;
	*/
	
	/** "fairer" code - probability of increasing 0.9... */
	byte c;	
        do
	:: c < 9 -> c++
	:: c < 9 -> c++
	:: c < 9 -> c++
	:: c < 9 -> c++
	:: c < 9 -> c++
	:: c < 9 -> c++
	:: c < 9 -> c++
	:: c < 9 -> c++
	:: c < 9 -> c++
	:: break;
	od;
	array[i] = c;
	

	printf("\tarray[%d] = %d\n", i, array[i]);
}

init {

	int i = 0;
	
	
	/* 
	code that randomly initialises each cell of the array with a random value in the range [0,..,9] 
	*/
	printf("loading..\n");
	do
	:: i < 10 -> randinit(i); i++
	:: else -> break
	od;

	/* 
	code that sums even array cells and substracts odd ones 
	*/
	printf("thinking..\n");
	i = 0;
	do
	:: i < 10 -> if
		     :: i % 2 == 0 -> sum = sum + array[i]
		     :: i % 2 == 1 -> sum = sum - array[i]
		     fi;
		     i++;
	:: else -> break;
	od;

	printf("result: %d\n", sum); //display result
}

//ltl { [](sum <= 45) }

