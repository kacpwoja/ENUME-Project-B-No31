clear;

%   Functions

interval1 = 6;
interval2 = 10;
tasklim1 = 2;
tasklim2 = 12;

x = linspace(0, 14);
y = zeros(1, 100);
for i = 1:1:100
    y(i) = ftask1(x(i));
end

limy = linspace(-6, 2);
lim1 = ones(1, 100)*interval1;
lim2 = ones(1, 100)*interval2;
limt1 = ones(1, 100)*tasklim1;
limt2 = ones(1, 100)*tasklim2;

%   Newton method
figure(1);
hold on;
plot(x, y, 'r', 'LineWidth', 2, 'DisplayName', 'f(x)');
%first zero

xprev = interval1;
xnext = xprev - ftask1(xprev)/ftask1der(xprev); 
xlims1(1) = xprev;
xlims1(2) = xnext;
iterations1 = 0;

while xnext ~= xprev && ftask1(xnext) ~= 0 && iterations1 < 100
    xnew = xnext - ftask1(xnext)/ftask1der(xnext); 
    xprev = xnext;
    xnext = xnew;
    iterations1 = iterations1 + 1;
    xlims1(iterations1+2) = xnew;
end

newtonzero1 = xnew;

linx = linspace(xlims1(1), xlims1(2));
linp(1) = (-ftask1(xlims1(1)))/(xlims1(2)-xlims1(1));
linp(2) = ftask1(xlims1(1)) - linp(1)*xlims1(1);
liny = polyval(linp, linx);
plot(linx, liny, 'b', 'DisplayName', 'Tangent Lines');
   
legend('AutoUpdate', 'off');
for i = 2:1:length(xlims1)-1
   linx = linspace(xlims1(i), xlims1(i+1));
   linp(1) = (-ftask1(xlims1(i)))/(xlims1(i+1)-xlims1(i));
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

xprev = interval2;
xnext = xprev - ftask1(xprev)/ftask1der(xprev);
xlims2(1) = xprev;
xlims2(2) = xnext;
iterations2 = 0;

while xnext ~= xprev && ftask1(xnext) ~= 0 && iterations2 < 100
    xnew = xnext - ftask1(xnext)/ftask1der(xnext); 
    xprev = xnext;
    xnext = xnew;
    iterations2 = iterations2 + 1;
    xlims2(iterations2+2) = xnew;
end

newtonzero2 = xnew;

for i = 1:1:length(xlims2)-1
   linx = linspace(xlims2(i), xlims2(i+1));
   linp(1) = (-ftask1(xlims2(i)))/(xlims2(i+1)-xlims2(i));
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
plot(lim1, limy, 'b--', 'DisplayName', 'Starting Intervals');
plot(limt1, limy, 'r--', 'DisplayName', 'Task Intervals');
plot(newtonzero1, ftask1(newtonzero1), 'gx', 'LineWidth', 7, 'DisplayName', 'Found Roots');
legend('AutoUpdate', 'off');
plot(lim2, limy, 'b--' );
plot(limt2, limy, 'r--' );
plot(newtonzero2, ftask1(newtonzero2), 'gx', 'LineWidth', 7);
grid on;
box off;
legend('show');
title('Newton Method (Task 1b)');