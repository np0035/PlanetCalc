function planets = edit_system(pls)
    % This function allows the user to edit an existing system of planets.
    while(1)

        % Display current system
        fprintf('Current system parameters:\n\n');
        for i = 1:length(pls)
            fprintf('%s\n-------\n', pls(i).name);
            fprintf('Position: [%s]\n', num2str(pls(i).pos));
            fprintf('Velocity: [%s]\n', num2str(pls(i).vel));
            fprintf('Mass: %f\n\n', pls(i).mass);
        end
    
        % Prompt user for planet to edit
        edit_name = input(['Type the name of the planet to edit, or type ' ...
            '"0" to save the new system: '],"s");

        % Stop editing if user types 0, and save the system
        if strcmp(edit_name, '0')
            system_name_ = input(['\nNew system name (type old name to' ...
                ' overwrite): '],"s");
            save(fullfile('saved_systems',system_name_), 'planets');
            system_dir = fullfile(pwd,'saved_systems/');
            fprintf('\n%s saved to %s and will be loaded automatically.\n', ...
                system_name_, system_dir);
            break
        end

        % Edit planet if name is found
        is_planet_found = false;
        for i = 1:length(pls)
            if strcmp(pls(i).name, edit_name)
                pls(i) = edit_planet(pls(i));
                fprintf('%s edited.\n', pls(i).name);
                is_planet_found = true;
                break
            end
        end

        % Handle planet not found
        if (~is_planet_found)
            fprintf('%s not found in the current system.', edit_name);
        end
        planets = pls;
    end

    % Return planets
end