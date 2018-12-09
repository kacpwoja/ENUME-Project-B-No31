clear;

p = [3 4 -6 4 7];
pd = polyder(p);

xprev = -2;
xnext = xprev - polyval(p, xprev)/polyval(pd, xprev);
iterations1 = 0;
xpoints(1) = xprev;
xpoints(2) = xnext;

while xnext ~= xprev && polyval(p, xnext) ~= 0 && iterations1 < 100
    xnew = xnext - polyval(p, xnext)/polyval(pd, xnext);
    xprev = xnext;
    xnext = xnew;
    
    xpoints(iterations1 + 3) = xnext;
    iterations1 = iterations1 + 1;
end

root1 = xnext;
ypoints = polyval(p, xpoints);

xprev = -1;
xnext = xprev - polyval(p, xprev)/polyval(pd, xprev);
iterations2 = 0;

while xnext ~= xprev && abs(polyval(p, xnext)) >= 10e-16 && iterations2 < 100
    xnew = xnext - polyval(p, xnext)/polyval(pd, xnext);
    xprev = xnext;
    xnext = xnew;
    iterations2 = iterations2 + 1;
end

root2 = xnext;

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
title('Found real roots - Newton');
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

saveas(1, "./plots/new.fig");
saveas(1, "./plots/new.png");