function alfa_beta = fitting_slope( x, y )
    
    options = optimset('MaxFunEvals',1000, 'MaxIter', 1000);
    alfa_beta = fminsearch(@(par_fit) myfunc(par_fit,x,y),rand(1,2), options);

end

