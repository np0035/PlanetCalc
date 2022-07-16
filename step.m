function planets = step(planets, G, precision)
    for p = 1:length(planets)
        % Reset force vector
        planets(p).current_force = [0,0];
    end

    for p1 = 1:length(planets)
        % Add up all the gravities acting on p1 by the other planets
        for p2 = 1:length(planets)

            % We don't need to consider the planet itself
            if ~compare_planets(planets(p1),planets(p2))

                % Get force between planets
                planets(p1).current_force = planets(p1).current_force ...
                    + get_force(planets(p1),planets(p2),G);
            end
        end
    end

    for p = 1:length(planets)
        planets(p).acc = planets(p).current_force ./ planets(p).mass;
        planets(p).vel = planets(p).vel + ((planets(p).acc) * precision);
        planets(p).pos = planets(p).pos + ((planets(p).vel) .* precision);
    end
end