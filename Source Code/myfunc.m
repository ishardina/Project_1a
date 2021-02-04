function val = myfunc(par_fit,x,y)

val = norm(y - (par_fit(2).*(x.^-par_fit(1))));