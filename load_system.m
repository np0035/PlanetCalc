function planets = load_system()
    % This function loads a system saved to the hard drive.
    %
    % Outputs:
    % planets - An array of planet structures

    %% Display the current list of systems
    while (1)
        fprintf('Systems available to load:\n');
    
        % Get list of files
        files = dir('saved_systems');
        system_names = files;
    
        % Separate them into just the names of the files and display them
        for i = 1:length(system_names)
            [~,system,~] = fileparts(system_names(i).name);
            disp(system);
        end
    
        %% Allow the user to choose a system
        user_choice = input(['\nType the name of ' ...
            'one of the systems to select it, or press 0 to cancel:\n'],"s");
        planets = [];
    
        try
            planets = load(fullfile('saved_systems',user_choice));
            fprintf('%s loaded.\n\n', user_choice)
            display_system(planets.planets);
            return
        catch
            if strcmp('0',user_choice)
                planets = [];
                return
            end
            fprintf('\nInvalid system; please try again.')
        end
    end
end