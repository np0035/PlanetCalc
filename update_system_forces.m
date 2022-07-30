function planets = update_system_forces(universe, planets)

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
                    + get_force(universe, planets(p1), planets(p2));
            end
        end
    end
end

