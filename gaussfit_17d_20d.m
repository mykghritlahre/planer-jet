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

% Load data for 3d
load velo_at_x3d.txt;
load y_at_x3d.txt;
f1 = fit(y_at_x3d, velo_at_x3d, 'gauss1');
disp(['At 3d, centerline velocity is ', num2str(f1.a1), ...
    ', half-width is ', num2str(f1.c1 * sqrt(log(2))), ...
    ', and centerline is at y = ', num2str(f1.b1)]);
y1 = 14.1:0.1:31;
u1 = f1(y1);
fh1 = figure('Name', 'Gaussian curve fitting at 3d');
plotGaussianFit(fh1, y_at_x3d, velo_at_x3d, 'Gaussian curve fitting at 3d', lineWidth, markerSize, markerFaceColor, markerEdgeColor, figureColor, fontName, fontSize, figurePosition);

% Load data for 17d
load velo_at_x17d.txt;
load y_at_x17d.txt;
f2 = fit(y_at_x17d, velo_at_x17d, 'gauss1');
disp(['At 17d, centerline velocity is ', num2str(f2.a1), ...
    ', half-width is ', num2str(f2.c1 * sqrt(log(2))), ...
    ', and centerline is at y = ', num2str(f2.b1)]);
y2 = 14.1:0.1:31;
u2 = f2(y2);
fh2 = figure('Name', 'Gaussian curve fitting at 17d');
plotGaussianFit(fh2, y_at_x17d, velo_at_x17d, 'Gaussian curve fitting at 17d', lineWidth, markerSize, markerFaceColor, markerEdgeColor, figureColor, fontName, fontSize, figurePosition);

% Load data for 20d
load velo_at_x20d.txt;
load y_at_x20d.txt;
f3 = fit(y_at_x20d, velo_at_x20d, 'gauss1');
disp(['At 20d, centerline velocity is ', num2str(f3.a1), ...
    ', half-width is ', num2str(f3.c1 * sqrt(log(2))), ...
    ', and centerline is at y = ', num2str(f3.b1)]);
y3 = 14.1:0.1:31;
u3 = f3(y3);
fh3 = figure('Name', 'Gaussian curve fitting at 20d');
plotGaussianFit(fh3, y_at_x20d, velo_at_x20d, 'Gaussian curve fitting at 20d', lineWidth, markerSize, markerFaceColor, markerEdgeColor, figureColor, fontName, fontSize, figurePosition);

% Local function for plotting Gaussian fit
function plotGaussianFit(fh, y_data, velo_data, title_str, lineWidth, markerSize, markerFaceColor, markerEdgeColor, figureColor, fontName, fontSize, figurePosition)
    figure(fh);
    plot(velo_data, y_data, 'LineWidth', lineWidth, 'Color', 'k');
    hold on;
    plot(velo_data, y_data, 'Marker', 'o', ...
        'LineStyle', 'none', ...
        'MarkerSize', markerSize, ...
        'MarkerFaceColor', markerFaceColor, ...
        'MarkerEdgeColor', markerEdgeColor);
    title(title_str);
    xlabel('$U$, $ms^{-1}$', 'Interpreter', 'Latex');
    ylabel('$y$, $cm$', 'Interpreter', 'Latex');
    legend('Gaussian fit', 'Measured data');
    set(legend, 'Location', 'Best');
    set(legend, 'Orientation', 'Horizontal');
    set(legend, 'Box', 'Off');
    grid off; box on;
    set(gcf, 'Color', figureColor);
    set(gca, 'Color', figureColor);
    set(gca, 'FontName', fontName, 'FontSize', fontSize);
    set(gcf, 'Units', 'Centimeters');
    set(gcf, 'Position', figurePosition);
end
