function planet = edit_planet(p)
    % This function allows the user to edit a planet's parameters.

    fprintf(['Input new values for the planet''s parameters, or type ' ...
        '"0" to keep the original value.\nInput positions and velocity' ...
        ' values as a polar vector in the format [theta,radius]\n']);

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
            continue
        end

        if (strcmp(param_names{i}, 'pos') || strcmp(param_names{i}, 'vel'))
            [params.(param_names{i})(1), params.(param_names{i})(2)] ...
            = pol2cart(deg2rad(params.(param_names{i})(1)), ...
            params.(param_names{i})(2));
        end
    end

    planet = create_planet(params.name, params.pos, params.vel, ...
        params.mass);

    % Return planet
end

