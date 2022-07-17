function planets = edit_system(pls)
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
            '"0" to save: '],"s");

        % Stop editing if user types 0
        if strcmp(edit_name, '0')
            break
        end

        % Get planet to edit
        for i = 1:length(pls)
            if strcmp(pls(i).name, edit_name)
                edit_planet = pls(i);
                break
            end
        end
    end
end