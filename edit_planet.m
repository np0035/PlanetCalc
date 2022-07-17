function planet = edit_planet(p)
    % This function allows the user to edit a planet's parameters.

    fprintf(['Input new values for the planet''s parameters, or type ' ...
        '"0" to keep the original value.\nInput positions and velocity' ...
        ' values as a 2D vector in the format [x,y]\n']);

    params.name = input('Planet name: ',"s");
    params.pos = input('Position: ');
    params.vel = input('Velocity: ');
    params.mass = input('Mass: ');

    if strcmp(params.name, '0')
        params.name = p.name;
    end

    param_names = fieldnames(params);

    for i = 2:length(param_names)
        if params.(param_names{i}) == 0
            params.(param_names{i}) = p.(param_names{i});
        end
    end

    planet = create_planet(params.name, params.pos, params.vel, ...
        params.mass);

    % Return planet
end

