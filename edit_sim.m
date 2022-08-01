function universe = edit_sim(u)
    %  This function allows the user to edit the global parameters of the
    %  simulation.

    % Display current parameters
    fprintf('Current parameters:\n');
    fprintf('G = %f\n', u.G);
    fprintf('Precision (dt) = %f\n', u.precision)
    fprintf('Total simulation time = %f\n', u.time);
    fprintf('Animation speed (steps per frame) = %d\n', u.animation_speed);
    if u.calc_method == 2
        fprintf('Calculation method: Runge-Kutta 4th Order\n')
    else
        fprintf('Calculation method: Euler\n')
    end
    fprintf('----------------------------------------\n');
    fprintf('Input new parameters, or type "0" to keep original value.\n');

    % Allow user to input new parameters
    universe.G = input('G = ');
    universe.precision = input('Precision (dt) = ');
    universe.time = input('Total simulation time = ');
    universe.animation_speed = input( ...
        'Animation speed (steps per frame) = ');
    calc_method = input(['Calculation method ' ...
        '(input "e" for Euler or "r" for Runge-Kutta 4th Order):\n'], "s");
    if strcmp(calc_method, 'e')
        universe.calc_method = 1;
    elseif strcmp(calc_method, 'r')
        universe.calc_method = 2;
    else
        universe.calc_method = 0;
    end
    universe.steps = 0; % Initialize this variable

    % Restore default values in special case
    param_names = fieldnames(u);
    for i = 1:length(param_names)
        if (universe.(param_names{i}) == 0)
            universe.(param_names{i}) = u.(param_names{i});
        end
    end
    
    universe.steps = universe.time/universe.precision;

    % Return universe
end

