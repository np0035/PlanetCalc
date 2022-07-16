function isEqual = compare_planets(p1,p2)
    % Compares two planets to find if they are the same planet
    %
    % Inputs:
    % p1 - planet struct, the first planet to be compared
    % p2 - planet struct, the second planet to be compared
    %
    % Outputs:
    % isEqual - logical, whether or not the planets are equal

    % Assume planets are equal
    isEqual = true;

    % Planets are not equal if any of these conditions are met
    if p1.pos ~= p2.pos
        isEqual = false;
    elseif p1.vel ~= p2.vel
        isEqual = false;
    elseif p1.mass ~= p2.mass
        isEqual = false;
    end
end