function planet = edit_planet(p)
    % This function allows the user to edit a planet's parameters.

    fprintf(['Input new values for the planet''s parameters, or type ' ...
        '"0" to keep the original value.\nInput positions and velocity' ...
        ' values as a 2D vector in the format [x,y]']);

    planet.name = input('Planet name: ',"s");
    planet.pos = input('Position: ');
    planet.vel = input('Velocity: ');
    planet.mass = input('Mass: ');

    params = fieldnames(planet);

    if strcmp(planet.name, '0')
        planet.name = p.name;
    end

    for i = 1:length(params)
        if planet.(params{i}) == 0
            planet.(params{i}) = p.(params{i});
        end
    end

    % Return planet
end

