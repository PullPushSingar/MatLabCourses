function [xsol,fval,history,searchdir] = runfmincon1
 
% Set up shared variables with OUTFUN
history.x = [];
history.fval = [];
searchdir = [];
 
% call optimization
x0 = [2.0, 0.0];
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
     f = 2*x(1)^2 + 4*x(1)*x(2)^3 - 10*x(1)*x(2) + x(2)^2;
 end
 
function [b, c, beq, ceq] = confun( x )
    b = -x(1) + x(2).^2 - x(2).*6 + 9;
    c = -x(2) + x(1).^3 + 0.5;
    beq = [];
    ceq = [];
end

end