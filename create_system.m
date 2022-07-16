function planets = create_system()
    % This function allows the user to create a new system of planets.
    %
    % Outputs:
    % planets - An array of planet structures

    name = "";
    num_planets = 0;
    planet_max = 10;

    % User instructions
    fprintf(['\nEnter data for each planet. Type "/" for the planet name' ...
        'to stop. %d planet maximum.'], planet_max);
    fprintf(['\nInput positions and velocity values as a 2D vector in ' ...
        'the format [x,y]']);

    % Not an infinite loop - planet cap is in place
    while (1)

        % Prompt for name and test for exit value
        name_prompt = sprintf('\nPlanet %d name: ', num_planets+1);
        name = input(name_prompt,"s");
        if (strcmp(name,'/'))
            break
        end
        
        % Prompt for other vars
        pos = input('\nInitial position: ');
        vel = input('\nInitial velocity: ');
        mass = input('\nPlanet mass: ');

        num_planets = num_planets + 1;

        % Exit if planet cap is exceeded
        if (num_planets > 10)
            break
        end
    end

    % Add planet to the list
    for i = 1:num_planets
        planets(i) = create_planet(name,pos,vel,mass);
    end
end
