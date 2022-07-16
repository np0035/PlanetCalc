function result = driver(planets, G, precision, steps)

    % Generate empty array of positions
    positions = zeros(2,length(planets),steps);

    planets_1 = planets;

    for i = 1:steps
        % Simulate motion
        planets_1 = step(planets_1, G, precision);

        % Add new position entry
        for j = 1:length(planets_1)
            positions(:,j,i) = planets_1(j).pos;
        end

        % Note progress every so often
        progress_0 = (i-1)/steps*100;
        progress_1 = i/steps*100;
        if (floor(progress_0/5) ~= floor(progress_1/5))
            fprintf('Progress: %.0f%c\n', progress_1, char(37));
        end
    end
    result = positions;
end