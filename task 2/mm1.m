clear;

p = [3 4 -6 4 7];
r = roots(p);

interval1 = -2.6;
interval2 = 0;

x = linspace(interval1,interval2);
y = polyval(p, x);
figure(1)
ylim([-15 15]);
hold on;
plot(x, y, 'r', 'LineWidth', 2, 'DisplayName', 'f(x)');
ax = gca;
ax.XAxisLocation = 'origin';
title('Found real roots - MM1');
grid on;
box off;

limy = linspace(-15,15);
lim11 = ones(1,100)*-2.5;
lim12 = ones(1,100)*-2;
plot(lim11, limy, 'b--', 'DisplayName', 'Interval 1');
legend('AutoUpdate', 'off');
plot(lim12, limy, 'b--');

lim21 = ones(1,100)*-1;
lim22 = ones(1,100)*-0.5;
legend('AutoUpdate', 'on');
plot(lim21, limy, 'g--', 'DisplayName', 'Interval 2');
legend('AutoUpdate', 'off');
plot(lim22, limy, 'g--');

x0 = -2.5;
x1 = -2;
x2 = (x0+x1)/2;

iterations1 = 0;

while iterations1 < 100 && polyval(p, x2) ~= 0 && x0 ~= x1 && x1 ~= x2 && x0 ~= x2
    z0 = x0 - x2;
    z1 = x1 - x2;
    
    c = polyval(p, x2);
    b = (polyval(p, x2) * (z1 + z0) * (z1 - z0) + z0 * z0 * polyval(p, x1) - z1 * z1 * polyval(p, x0))/((z0 - z1) * z0 * z1);
    a = (polyval(p, x0) - polyval(p, x2))/(z0*z0) - b/z0;
    
    delta = b*b - 4*a*c;
    
    if abs(b+sqrt(delta)) >= abs(b-sqrt(delta))
        xnew = x2 - (2*c)/(b + sqrt(delta));
    else
        xnew = x2 - (2*c)/(b - sqrt(delta));
    end
    
    d0 = abs(xnew - x0);
    d1 = abs(xnew - x1);
    d2 = abs(xnew - x2);
    
    if d0 >= d1 && d0 >= d2
        x0 = x2;
        x2 = xnew;
    elseif d1 >= d0 && d1 >= d2
        x1 = x2;
        x2 = xnew;
    elseif d2 >= d0 && d2 >= d1
        x2 = xnew;
    end
    
    iterations1 = iterations1 +1;
end

root1 = xnew;

legend('AutoUpdate', 'on');
plot(root1, polyval(p, root1), 'bx', 'LineWidth', 7, 'DisplayName', 'Root 1');
legend('AutoUpdate', 'off');

% second

x0 = -0.5;
x1 = -1;
x2 = (x0+x1)/2;

iterations2 = 0;

while iterations2 < 100 && polyval(p, x2) ~= 0 && x0 ~= x1 && x1 ~= x2 && x0 ~= x2
    z0 = x0 - x2;
    z1 = x1 - x2;
    
    c = polyval(p, x2);
    b = (polyval(p, x2) * (z1 + z0) * (z1 - z0) + z0 * z0 * polyval(p, x1) - z1 * z1 * polyval(p, x0))/((z0 - z1) * z0 * z1);
    a = (polyval(p, x0) - polyval(p, x2))/(z0*z0) - b/z0;
    
    delta = b*b - 4*a*c;
    
    if abs(b+sqrt(delta)) >= abs(b-sqrt(delta))
        xnew = x2 - (2*c)/(b + sqrt(delta));
    else
        xnew = x2 - (2*c)/(b - sqrt(delta));
    end
    
    d0 = abs(xnew - x0);
    d1 = abs(xnew - x1);
    d2 = abs(xnew - x2);
    
    if d0 >= d1 && d0 >= d2
        x0 = x2;
        x2 = xnew;
    elseif d1 >= d0 && d1 >= d2
        x1 = x2;
        x2 = xnew;
    elseif d2 >= d0 && d2 >= d1
        x2 = xnew;
    end
    
    iterations2 = iterations2 +1;
end

root2 = xnew;

legend('AutoUpdate', 'on');
plot(root2, polyval(p, root2), 'gx', 'LineWidth', 7, 'DisplayName', 'Root 2');
legend('AutoUpdate', 'off');

saveas(1, "./plots/mm1.fig");
saveas(1, "./plots/mm1.png");
