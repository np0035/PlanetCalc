function planets = load_system()
    % This function loads a system saved to the hard drive.
    %
    % Outputs:
    % planets - An array of planet structures

    %% Display the current list of systems
    fprintf('Systems available to load:\n');

    % Get list of files
    files = dir('saved_systems');
    system_names = files;

    % Separate them into just the names of the files and display them
    for i = 1:length(system_names)
        [~,system,~] = fileparts(system_names(i).name);
        disp(system);
    end
end