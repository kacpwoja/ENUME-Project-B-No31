clear;

interval1 = 2;
interval2 = 12;

x = linspace(0, 14);
y = zeros(1, 100);
for i = 1:1:100
    y(i) = ftask1(x(i));
end

limy = linspace(-6, 2);
lim1 = ones(1, 100)*interval1;
lim2 = ones(1, 100)*interval2;

figure(1);
hold on;
plot(x, y, 'r', 'LineWidth', 2, 'DisplayName', 'f(x)');
plot(lim1, limy, 'b--', 'DisplayName', 'Interval');
legend('AutoUpdate', 'off');
plot(lim2, limy, 'b--');
grid on;
box off;
legend('show');
title('Function for Task 1');