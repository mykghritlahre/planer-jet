clearvars

% Graph specifications
lineWidth = 0.2;
markerSize = 5.0;
markerFaceColor = 'k';
markerEdgeColor = 'none';
figureColor = 'w';
fontName = 'Garamond';
fontSize = 14;
figurePosition = [10 7 24 8];

% at 14d
load velo_at_x14d.txt;
load y_at_x14d.txt;

f = fit(y_at_x14d, velo_at_x14d, 'gauss1');
disp(['The centerline velocity at 14d is ', num2str(f.a1), ...
    ', the half-width at 14d is ', num2str(f.c1 * sqrt(log(2))), ...
    ', and the centerline at 14d is at y = ', num2str(f.b1)])

y = 17.5:0.1:26.5;
u = f(y);

fh1 = figure('Name', 'Gaussian curve fitting at 14d');
plot(u, y, 'LineWidth', lineWidth, 'Color', 'k');
hold on;
plot(velo_at_x14d, y_at_x14d, 'Marker', 'o', ...
    'LineStyle', 'none', ...
    'MarkerSize', markerSize, ...
    'MarkerFaceColor', markerFaceColor, ...
    'MarkerEdgeColor', markerEdgeColor);

% at 23d
load velo_at_x23d.txt;
load y_at_x23d.txt;

f2 = fit(y_at_x23d, velo_at_x23d, 'gauss1');
disp(['The centerline velocity at 23d is ', num2str(f2.a1), ...
    ', the half-width at 23d is ', num2str(f2.c1 * sqrt(log(2))), ...
    ', and the centerline at 23d is at y = ', num2str(f2.b1)])

y2 = 15.1:0.1:29.5;
u2 = f2(y2);

fh2 = figure('Name', 'Gaussian curve fitting at 23d');
plot(u2, y2, 'LineWidth', lineWidth, 'Color', 'k');
hold on;
plot(velo_at_x23d, y_at_x23d, 'Marker', 'o', ...
    'LineStyle', 'none', ...
    'MarkerSize', markerSize, ...
    'MarkerFaceColor', markerFaceColor, ...
    'MarkerEdgeColor', markerEdgeColor);

% at 26d
load velo_at_x26d.txt;
load y_at_x26d.txt;

f3 = fit(y_at_x26d, velo_at_x26d, 'gauss1');
disp(['The centerline velocity at 26d is ', num2str(f3.a1), ...
    ', the half-width at 26d is ', num2str(f3.c1 * sqrt(log(2))), ...
    ', and the centerline at 26d is at y = ', num2str(f3.b1)])

y3 = 14.1:0.1:31;
u3 = f3(y3);

fh3 = figure('Name', 'Gaussian curve fitting at 26d');
plot(u3, y3, 'LineWidth', lineWidth, 'Color', 'k');
hold on;
plot(velo_at_x26d, y_at_x26d, 'Marker', 'o', ...
    'LineStyle', 'none', ...
    'MarkerSize', markerSize, ...
    'MarkerFaceColor', markerFaceColor, ...
    'MarkerEdgeColor', markerEdgeColor);

% at 29d
load velo_at_x29d.txt;
load y_at_x29d.txt;

f4 = fit(y_at_x29d, velo_at_x29d, 'gauss1');
disp(['The centerline velocity at 29d is ', num2str(f4.a1), ...
    ', the half-width at 29d is ', num2str(f4.c1 * sqrt(log(2))), ...
    ', and the centerline at 29d is at y = ', num2str(f4.b1)])

y4 = 13.8:0.1:31.8;
u4 = f4(y4);

fh4 = figure('Name', 'Gaussian curve fitting at 29d');
plot(u4, y4, 'LineWidth', lineWidth, 'Color', 'k');
hold on;
plot(velo_at_x29d, y_at_x29d, 'Marker', 'o', ...
    'LineStyle', 'none', ...
    'MarkerSize', markerSize, ...
    'MarkerFaceColor', markerFaceColor, ...
    'MarkerEdgeColor', markerEdgeColor);

% Set common graph specifications
for fh = [fh1, fh2, fh3, fh4]
    figure(fh);
    hold off; grid off; box on;
    set(gcf, 'Color', figureColor);
    set(gca, 'Color', figureColor);
    set(gca, 'FontName', fontName, 'FontSize', fontSize);
    set(gcf, 'Units', 'Centimeters');
    set(gcf, 'Position', figurePosition);
    xlabel('$U$, $ms^{-1}$', 'Interpreter', 'Latex');
    ylabel('$y$, $cm$', 'Interpreter', 'Latex');
    legend('Gaussian fit', 'Measured data');
    set(legend, 'Location', 'Best');
    set(legend, 'Orientation', 'Horizontal');
    set(legend, 'Box', 'Off');
end
