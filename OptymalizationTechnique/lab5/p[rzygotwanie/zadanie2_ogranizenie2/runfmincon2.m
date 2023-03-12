function [xsol,fval,history,searchdir] = runfmincon2
 
% Set up shared variables with OUTFUN
history.x = [];
history.fval = [];
searchdir = [];
 
% call optimization
x0 = [-5.0, -5.0];
options = optimoptions(@fmincon,'OutputFcn',@outfun,... 
    'Display','iter','Algorithm','active-set');
[xsol,fval] = fmincon(@objfun,x0,[],[],[],[],[],[],@confun,options);
 
 function stop = outfun(x,optimValues,state)
     stop = false;
 
     switch state
         case 'init'
             hold on
         case 'iter'
           history.fval = [history.fval; optimValues.fval];
           history.x = [history.x; x];
           searchdir = [searchdir;... 
                        optimValues.searchdirection'];
           plot(x(1), x(2),'--gs', 'MarkerSize', 5);
          case 'done'
             hold off
         otherwise
     end
 end
 
 function f = objfun(x)
     f = 2*x(1)^2 + 1.05*x(1)^4 - x(1)^6/6 + x(1)*x(2) + x(2)^2;
 end
 
function [b, c, beq, ceq] = confun( x )
    b = -x(1) - x(2) - 6.0;
    c = x(2) + (x(1) + 2).^2;
    beq = [];
    ceq = [];
end

end