function planet = create_planet(pos,vel,mass)
    % Creates a planet structure
    %
    % Inputs:
    % pos - 1x2 double, the x and y positions
    % vel - 1x2 double, the x and y velocities
    % mass - double, the planet's mass
    planet.pos = pos;
    planet.vel = vel;
    planet.acc = [0,0];
    planet.mass = mass;
    planet.current_force = [0,0];
end