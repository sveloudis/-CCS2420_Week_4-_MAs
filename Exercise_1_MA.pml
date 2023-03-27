#define N 4
bool turn[N] = { 1,0,0,0 }

active[N] proctype process() {
	do 
	:: true ->
           ( turn[_pid] == 1 ) -> 
	   printf("%d\n", _pid) -> 
           turn[_pid] = 0 -> 
	   turn[(_pid+1) % N] = 1 
	od
}



