clear;

p = [3 4 -6 4 7];

interval1 = -2.5;
interval2 = 0;

for i = 1:1:2
    x = linspace(interval1,interval2);
    y = polyval(p, x);
    figure(i)
    plot(x, y, 'r', 'LineWidth', 2);
    ax = gca;
    ax.XAxisLocation = 'origin';
    title(sprintf("Polynomial f(x) on interval [%.1f, %.1f]", interval1, interval2));
    grid on;
    box off;
    
    saveas(i, sprintf("./plots/poly%d.fig", i));
    saveas(i, sprintf("./plots/poly%d.png", i));
    
    interval1 = -3;
    interval2 = 2;
end