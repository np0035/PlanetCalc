clear all;
clc;

% Set up system
fprintf('Building universe...\n');
planets(1) = create_planet([0 0], [0 0], 10);
planets(2) = create_planet([10 20], [3 0], 1);

% Set universe parameters
G = 0.5;
precision = 0.01;
steps = 10000;

fprintf(['Simulation started: %d planet trajectories extrapolated over' ...
    '%d timesteps\n'])
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
