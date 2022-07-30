function planets = step_runge_kutta_4(universe, planets)
    
    % Get forces in system
    planets = update_system_forces(universe, planets);

    % Initialize vars
    pos_placeholder = zeros([length(planets), 2]);
    k = zeros([length(planets), 4, 2]);
    
    for p = 1:length(planets)

        % Create a placeholder so we don't lose the original position
        pos_placeholder(p,:) = planets(p).pos;

        % Update acceleration
        planets(p).acc = planets(p).current_force ./ planets(p).mass;

        % Slope at beginning of timestep (k1)
        k(p, 1, :) = planets(p).vel + ((planets(p).acc) * universe.precision);

        % Use this slope to step halfway through the timestep
        planets(p).pos = planets(p).pos + reshape(k(p, 1, :) ...
            * universe.precision ...
            * 0.5,  [1 2]);
    end

    % Calculate slope at midpoint
    planets = update_system_forces(universe, planets);
    for p = 1:length(planets)
        planets(p).acc = planets(p).current_force ./ planets(p).mass;

        % k2
        k(p, 2, :) = planets(p).vel + ((planets(p).acc) * universe.precision);

        % Reset position
        planets(p).pos = pos_placeholder(p,:);
        
        % Use this new slope to step halfway through the timestep again
        planets(p).pos = planets(p).pos + reshape(k(p, 2,  :) ...
            * universe.precision ...
            * 0.5, [1 2]);
    end

    % Calculate second estimate of slope at midpoint
    planets = update_system_forces(universe, planets);
    for p = 1:length(planets)
        planets(p).acc = planets(p).current_force ./ planets(p).mass;

        % k3
        k(p, 3, :) = planets(p).vel + ((planets(p).acc) * universe.precision);

        % Reset position
        planets(p).pos = pos_placeholder(p,:);
        
        % Use this third slope to step all the way through the timestep
        planets(p).pos = planets(p).pos + reshape(k(p, 3,  :) ...
            * universe.precision, [1 2]);
    end

    % Calculate estimate of slope at endpoint
    planets = update_system_forces(universe, planets);
    for p = 1:length(planets)
        planets(p).acc = planets(p).current_force ./ planets(p).mass;

        % k4
        k(p, 4, :) = planets(p).vel + ((planets(p).acc) * universe.precision);

        % Reset position
        planets(p).pos = pos_placeholder(p,:);

        % Calculate weighted sum of slopes
        planets(p).vel = reshape( ...
              (1/6)*k(p, 1, :) ...
            + (1/3)*k(p, 2, :) ...
            + (1/3)*k(p, 3, :) ...
            + (1/6)*k(p, 4, :), [1 2]);

        % Calculate final position using the weighted sum
        planets(p).pos = planets(p).pos + ((planets(p).vel) * universe.precision);
    end
end