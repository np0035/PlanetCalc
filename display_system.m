function display_system(pls)
    fprintf('Current System Parameters\n');
    fprintf('-------------------------\n\n')
        for i = 1:length(pls)
            [pol_pos(1), pol_pos(2)] = cart2pol(pls(i).pos(1), ...
                pls(i).pos(2));

            [pol_vel(1), pol_vel(2)] = cart2pol(pls(i).vel(1), ...
                pls(i).vel(2));

            fprintf('%s\n-------\n', pls(i).name);

            fprintf('Position:\n');
            fprintf('    Cartesian: [%s]\n', num2str(pls(i).pos));
            fprintf('    Polar: [%s]\n', num2str(pol_pos));

            fprintf('Velocity:\n');
            fprintf('    Cartesian: [%s]\n', num2str(pls(i).vel));
            fprintf('    Polar: [%s]\n', num2str(pol_vel));

            fprintf('Mass: %f\n\n', pls(i).mass);
        end
end

