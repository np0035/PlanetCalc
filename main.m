clear all;
clc;

fprintf('**************************************************\n');
fprintf('ORBITAL MOTION CALCULATOR\nCopyright 2022 by Nicholas Pittman\n');
fprintf('***************************************************\n\n');

% Set up system
fprintf('Building universe...\n');
planets(1) = create_planet([0 0], [0 0], 10);
planets(2) = create_planet([10 20], [1 0], 1);

% Set universe parameters
G = 5;
precision = 0.01;
time = 400;
steps = time/precision;

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
