function steps(start, end, no_steps) = [start:(end-start)/(no_steps-1):end];

function concat(listOfLists) = [for (a=listOfLists) for (b=a) b];
