clear;

%   Functions

interval1 = 2;
interval2 = 12;
interval3 = 8;

x = linspace(0, 14);
y = zeros(1, 100);
for i = 1:1:100
    y(i) = ftask1(x(i));
end

limy = linspace(-6, 2);
lim1 = ones(1, 100)*interval1;
lim2 = ones(1, 100)*interval2;
lim3 = ones(1, 100)*interval3;

%   Secant method
figure(1);
hold on;
plot(x, y, 'r', 'LineWidth', 2, 'DisplayName', 'f(x)');
%first zero

xprev = interval1;
xnext = interval3;
xlims1(1) = xprev;
xlims1(2) = xnext;
iterations1 = 0;

while xnext ~= xprev && ftask1(xnext) ~= 0 && iterations1 < 100
    xnew = (xprev * ftask1(xnext) - xnext * ftask1(xprev))/(ftask1(xnext) - ftask1(xprev));
    xprev = xnext;
    xnext = xnew;
    iterations1 = iterations1 + 1;
    xlims1(iterations1+2) = xnew;
end

secantzero1 = xnew;

linx = linspace(xlims1(1), xlims1(2));
linp(1) = (ftask1(xlims1(2))-ftask1(xlims1(1)))/(xlims1(2)-xlims1(1));
linp(2) = ftask1(xlims1(1)) - linp(1)*xlims1(1);
liny = polyval(linp, linx);
plot(linx, liny, 'b', 'DisplayName', 'Secant Lines');
   
legend('AutoUpdate', 'off');
for i = 2:1:length(xlims1)-1
   linx = linspace(xlims1(i), xlims1(i+1));
   linp(1) = (ftask1(xlims1(i+1))-ftask1(xlims1(i)))/(xlims1(i+1)-xlims1(i));
   linp(2) = ftask1(xlims1(i)) - linp(1)*xlims1(i);
   liny = polyval(linp, linx);
   plot(linx, liny, 'b');
end

ylims1 = zeros(1, length(xlims1));
for i = 1:1:length(xlims1)
    ylims1(i) = ftask1(xlims1(i));
end

plot(xlims1, ylims1, 'bx', 'LineWidth', 2);

%second zero

xprev = interval3;
xnext = interval2;
xlims2(1) = xprev;
xlims2(2) = xnext;
iterations2 = 0;

while xnext ~= xprev && ftask1(xnext) ~= 0 && iterations2 < 100
    xnew = (xprev * ftask1(xnext) - xnext * ftask1(xprev))/(ftask1(xnext) - ftask1(xprev));
    xprev = xnext;
    xnext = xnew;
    iterations2 = iterations2 + 1;
    xlims2(iterations2+2) = xnew;
end

secantzero2 = xnew;

for i = 1:1:length(xlims2)-1
   linx = linspace(xlims2(i), xlims2(i+1));
   linp(1) = (ftask1(xlims2(i+1))-ftask1(xlims2(i)))/(xlims2(i+1)-xlims2(i));
   linp(2) = ftask1(xlims2(i)) - linp(1)*xlims2(i);
   liny = polyval(linp, linx);
   plot(linx, liny, 'b');
end

ylims2 = zeros(1, length(xlims2));
for i = 1:1:length(xlims2)
    ylims2(i) = ftask1(xlims2(i));
end

legend('AutoUpdate', 'on');
plot(xlims2, ylims2, 'bx', 'LineWidth', 2, 'DisplayName', 'Obtained Points');

%   Plots
plot(lim3, limy, 'b--', 'DisplayName', 'Starting Intervals');
plot(secantzero1, ftask1(secantzero1), 'gx', 'LineWidth', 7, 'DisplayName', 'Found Roots');
legend('AutoUpdate', 'off');
plot(lim1, limy, 'b--', lim2, limy, 'b--' );
plot(secantzero2, ftask1(secantzero2), 'gx', 'LineWidth', 7);
grid on;
box off;
legend('show');
title('Secant Method (Task 1a)');