function force = get_force(universe, p1, p2)
    % Calculates the force due to gravity acting on each planet.
    %
    % Inputs:
    % p1 - planet struct, the first of two planets attracting each other
    % p2 - planet struct, the second planet
    % G - The universal gravitational constant
    %
    % Outputs:
    % force - 1x2 double, the force vector due to gravity acting on each
    % planet

    % Get distance between planets
    r = hypot((p2.pos(1) - p1.pos(1)), p2.pos(2) - p1.pos(2));

    % Get direction of force (normalized vector)
    dir = [(p2.pos(1) - p1.pos(1)) (p2.pos(2) - p1.pos(2))] ./ r;

    % Get magnitude of force
    force_mag = universe.G*p1.mass*p2.mass / r^2;

    % Give the force a direction
    force = dir .* force_mag;
end

