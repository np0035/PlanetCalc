function result = driver(universe, planets)

    % Generate empty array of positions
    positions = zeros(2,length(planets),universe.steps);

    planets_1 = planets;

    for i = 1:universe.steps
        % Simulate motion
        if (universe.calc_method == 2)
            planets_1 = step_runge_kutta_4(universe, planets_1);
        else
            planets_1 = step(universe, planets_1);
        end

        % Add new position entry
        for j = 1:length(planets_1)
            positions(:,j,i) = planets_1(j).pos;
        end

        % Note progress every so often
        progress_0 = (i-1)/universe.steps*100;
        progress_1 = i/universe.steps*100;
        if (floor(progress_0/5) ~= floor(progress_1/5))
            fprintf('Progress: %.0f%c\n', progress_1, char(37));
        end
    end
    result = positions;
end