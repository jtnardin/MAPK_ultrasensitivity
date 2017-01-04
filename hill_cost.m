%hill_cost.m written 1-4-17 by JTN to compute the hill coefficient for a
%given data set. Assuming the x array has already been divided by its EC50
%(i.e. x = x/EC50).

function cost = hill_cost(x,y,q)

    hill = x.^q(1)./(1 + x.^q(1));

    cost = sum((y' - hill).^2); 

end