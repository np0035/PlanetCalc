clear all;
clc;

% Display header
fprintf('**************************************************\n')
fprintf('ORBITAL MOTION CALCULATOR\nCopyright 2022 by Nicholas Pittman\n')
fprintf('***************************************************\n\n')

% Set universe parameters
% G = 5;
% precision = 0.0001;
% time = 2;
% steps = time/precision;
% animation_speed = 5;

% Load universe - appears as "universe" in workspace
fprintf('Loading universe...\n');
load('universe.mat')

while (1)
% Show main menu & collect user input
isChoosing = true;
while isChoosing
    fprintf('1) Create a new system\n')
    fprintf('2) Load a saved system\n')
    fprintf('3) Run simulation of loaded system\n')
    fprintf('4) Edit loaded system\n')
    fprintf('5) Edit simulation parameters\n')
    user_choice = input('Select an option. Input "0" to exit. \n');
    
    switch user_choice
        case 0
            return
        case 1
            planets = create_system();
        case 2
            planets_struct = load_system();
            planets = planets_struct.planets;
        case 3
            % break out of loop and run simulation
            isChoosing = false;
        case 4
            planets = edit_system(planets);
        case 5
            universe = edit_sim(universe);
            save('universe.mat', 'universe');
            fprintf('New parameters saved.\n');
        otherwise
            % circle back
            fprintf('Please choose one of the options above.\n')
    end
end

% % Set up system
% planets(1) = create_planet('Sun', [0 0], [0 -0.5], 20);
% planets(2) = create_planet('Earth', [1 0], [0 10], 1);
% planets(3) = create_planet('Moon', [0.90 0], [0 3], 0.01);

fprintf('----------------\nSIMULATION STARTED\n----------------\n');

tic();

% Begin simulation
positions = driver(universe, planets);

% Display stats
fprintf('%d planet trajectories extrapolated over %d timesteps.\n', ...
    length(planets), universe.steps);
fprintf('Elapsed time: %f sec\n', toc());

% Transform position data into plottable matrices

x = squeeze(positions(1,:,:)).';
y = squeeze(positions(2,:,:)).';

if length(planets) <= 1
    x = x.';
    y = y.';
end

% Export CSV files
writematrix(x,'x-positions.csv');
writematrix(y,'y-positions.csv');

fprintf('Animation starting; press any key to exit.\n')

% Dummy character to detect a key press
set(gcf, 'CurrentCharacter', '}')

figure(gcf);
% Plot data
plot(x,y)
set(gca, 'Color', 'k');
axis equal
lim = axis;
axis(lim.*1.1)
hold on
marker = plot(x(1,:),y(1,:), 'o','MarkerFaceColor','red');
hold off

for i = 1:universe.animation_speed:length(x)
    if get(gcf, 'CurrentCharacter') ~= ('}')
        break
    end
    marker.XData = x(i,:);
    marker.YData = y(i,:);
    drawnow
end

fprintf('Animation exited at timestep %d\n', i);

end
