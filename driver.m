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
    end
    result = positions;
end