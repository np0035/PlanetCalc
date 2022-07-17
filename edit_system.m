function planets = edit_system(pls)
    fprintf('Current system parameters:\n\n');
    for i = 1:length(pls)
        fprintf('%s\n-------\n', pls(i).name);
        fprintf('Position: [%s]\n', num2str(pls(i).pos));
        fprintf('Velocity: [%s]\n', num2str(pls(i).vel));
        fprintf('Mass: %f\n\n', pls(i).mass);
    end

    edit_name = input('Type the name of the planet to edit: ');
    
    
end