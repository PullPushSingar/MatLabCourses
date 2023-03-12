function [xsol,fval,history,searchdir] = runfmincon
 
% Set up shared variables with OUTFUN
history.x = [];
history.fval = [];
searchdir = [];
 
% call optimization
x0 = [-6, 6];
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
         f = x(1)^2 + x(1)*x(2) + 0.5*x(2)^2 - x(1) - x(2);
     end

    function [c, ceq] = confun( x )
        c =  x(1) - x(2) + 7;
        ceq = [];
    end
end