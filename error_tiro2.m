function E=error_tiro2(x)
fun = @(x,y) [y(2); -sin(y(1))];
xf=20;
xi=0;
x0=0;
valor_final=0;
% x=condición inicial
% E=error
b_value_end=valor_final; % valor en xf, x(xf)=valor_final
opt=odeset('RelTol',1e-6);
[t,y]=ode45(fun,[xi,xf],[x0,x],opt);
E=y(end,1)-b_value_end;
return