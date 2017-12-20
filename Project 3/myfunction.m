function y = myfunction(c,J)
    function fval = myobj(x)  % x is a vector with 2 elements
        
   
        c        = x(1);
        J        = x(2);
        y        = sim('Second_connected');
        fval     = myfunction(c,J);
        
    end

end