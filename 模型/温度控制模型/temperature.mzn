array[int] of int: readings;
int: start;
int: l = length(readings);
set of int: time0 = 0..l;
set of int: time1 = 1..l;

enum choice = {strongly_cool,cool,do_nothing,heat,strongly_heat};
array[choice] of int: price = [9,3,0,1,5];
array[choice] of int: effort = [-5,-2,0,1,4];

array[time0] of var 25..30: temp;
array[time1] of var choice: action;
var int: cost;

constraint temp[0] = start;
constraint forall(i in time1)(temp[i] = (readings[i] + temp[i-1]) div 2 + effort[action[i]]);
constraint cost = sum(i in time1)(price[action[i]]);


solve minimize cost;

output ["temp = \(temp);\naction = \(action);\ncost = \(cost);"];
