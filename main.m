clear all;
clc;

fprintf('**************************************************\n');
fprintf('ORBITAL MOTION CALCULATOR\nCopyright 2022 by Nicholas Pittman\n');
fprintf('***************************************************\n\n');

% Set up system
fprintf('Building universe...\n');
planets(1) = create_planet([0 0], [0 -0.5], 20);
planets(2) = create_planet([1 0], [0 10], 1);
planets(3) = create_planet([0.90 0], [0 3], 0.01);

% Set universe parameters
G = 5;
precision = 0.0001;
time = 2;
steps = time/precision;
animation_speed = 5;

fprintf('Simulation started\n');

tic();

% Begin simulation
positions = driver(planets, G, precision, steps);

% Display stats
fprintf('%d planet trajectories extrapolated over %d timesteps.\n', ...
    length(planets), steps);
fprintf('Elapsed time: %f sec\n', toc());

% Transform position data into plottable matrices
x = squeeze(positions(1,:,:)).';
y = squeeze(positions(2,:,:)).';

% Export CSV files
writematrix(x,'x-positions.csv');
writematrix(y,'y-positions.csv');

% Plot data
plot(x,y)
axis equal
hold on
marker = plot(x(1,:),y(1,:), 'o','MarkerFaceColor','red');
hold off

for i = 2:animation_speed:length(x)
    marker.XData = x(i,:);
    marker.YData = y(i,:);
    drawnow
end