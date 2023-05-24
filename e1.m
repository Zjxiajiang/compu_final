clear all; figure
x0=0.001:0.01:2;
for k=1:length(x0)
    Error(k)=error_tiro(x0(k));
end
plot(x0,Error,'bo-',x0,0,'k.')
title('A1')

r1=fzero(@error_tiro,[0.8,1]),error_tiro(r1)
r2=fzero(@error_tiro,[1,1.95]),error_tiro(r2)
r3=fzero(@error_tiro,[1.99,2]),error_tiro(r3)

figure
Error = [];
x0=0.001:0.001:2;
for k=1:length(x0)
    Error(k)=error_tiro(x0(k));
end
plot(x0,Error,'bo-',x0,0,'k.')

figure
Error = [];
x0=1.99:0.001:2.01;
for k=1:length(x0)
	Error(k)=error_tiro(x0(k));
end
plot(x0,Error,'bo-',x0,0,'k.');

figure
fun = @(x,y) [y(2); -sin(y(1))];
xf=10;
xi=0;
x0=0;
opt=odeset('RelTol',1e-6);
hold on
[t08,y08]=ode45(fun,[xi,xf],[x0,0.8],opt);
[t1,y1]=ode45(fun,[xi,xf],[x0,1],opt);
plot(t08,y08(:,1), '-ob')
plot(t08,y08(:,2), '-or')
legend('Solucion', 'derivada')
title('x_1 = 0.8')
hold off
figure
hold on
plot(t1,y1(:,1), '-ob')
plot(t1,y1(:,2), '-or')
legend('Solucion', 'derivada')
title('x_1 = 1')
hold off

close all;
"Soluciones con raices"
for r=[r1, r2, r3]
    figure
    [t,y]=ode45(fun,[xi,xf+20],[x0,r],opt);
    y(end,1)
    y(end,2)
    plot(t,y(:,1), '-ob'); hold on
    plot(t,y(:,2), '-or'); hold off
    legend('Solucion', 'derivada')
    title(['x_1=' string(r)])
end

