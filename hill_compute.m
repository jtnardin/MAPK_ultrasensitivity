%hill_compute.m written 1-4-17 by JTN to compute Hill Coefficients for data
%using fminsearch

function q = hill_compute(x,y,plot_yn)

    ec50_loc = find(abs(y-0.5) == min(abs(y-.5))); %approximate EC50 location

    x = x/x(ec50_loc); %normalize x-axis
    
    q = fminsearch(@(q) hill_cost(x,y,q),1); %find hill coeff, q
    
    
    %check fit?
    if nargin >= 3
        if plot_yn == 1
            
            figure
            hold on
            plot(x,y)
            plot(x,x.^q./(1+x.^q))
            
            legend('Simulation','Fit hill')
            title(['Estimated hill coeff = ' num2str(q)])
            
            xlabel('E1tot/EC50')
                        
        end
    end
    

end