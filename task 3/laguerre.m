clear;

p = [3 4 -6 4 7];
pd = polyder(p);
pdd = polyder(pd);
n = length(p) - 1;

x = -2;
xp = 0;
iterations1 = 0;
xpoints(1) = x;

while iterations1 < 100 && polyval(p, x) ~= 0 && x ~= xp
    delta = (n-1)*((n-1)*polyval(pd, x)^2 - n*polyval(p, x)*polyval(pdd, x));
    if abs(polyval(pd, x) + sqrt(delta)) >= abs(polyval(pd, x) - sqrt(delta))
        xnew = x - (n*polyval(p, x))/(polyval(pd, x) + sqrt(delta));
    else
        xnew = x - (n*polyval(p, x))/(polyval(pd, x) - sqrt(delta));
    end
    
    xp = x;
    x = xnew;
    xpoints(iterations1 + 2) = x;
    iterations1 = iterations1 + 1;
end

root1 = x;
ypoints = polyval(p, xpoints);

x = -1;
xp = 0;
iterations2 = 0;

while iterations2 < 100 && abs(polyval(p, x)) >= 10e-16 && x ~= xp
    delta = (n-1)*((n-1)*polyval(pd, x)^2 - n*polyval(p, x)*polyval(pdd, x));
    if abs(polyval(pd, x) + sqrt(delta)) >= abs(polyval(pd, x) - sqrt(delta))
        xnew = x - (n*polyval(p, x))/(polyval(pd, x) + sqrt(delta));
    else
        xnew = x - (n*polyval(p, x))/(polyval(pd, x) - sqrt(delta));
    end
    
    xp = x;
    x = xnew;
    iterations2 = iterations2 + 1;
end

root2 = x;

y1 = polyval(p, root1);
y2 = polyval(p, root2);

interval1 = -2.5;
interval2 = 0;

figure(1)
x = linspace(interval1,interval2);
y = polyval(p, x);
figure(1)
ylim([-15 15]);
hold on;
plot(x, y, 'r', 'LineWidth', 2, 'DisplayName', 'f(x)');
ax = gca;
ax.XAxisLocation = 'origin';
title('Found real roots - Laguerre');
grid on;
box off;

limy = linspace(-15,15);
lim2 = ones(1,100)*-1;
lim1 = ones(1,100)*-2;

plot(lim1, limy, 'b--', 'DisplayName', 'Interval 1');
plot(root1, polyval(p, root1), 'bx', 'LineWidth', 7, 'DisplayName', 'Root 1');
plot(lim2, limy, 'g--', 'DisplayName', 'Interval 2');
plot(root2, polyval(p, root2), 'gx', 'LineWidth', 7, 'DisplayName', 'Root 2');

legend('show');

saveas(1, "./plots/lagurr.fig");
saveas(1, "./plots/lagurr.png");