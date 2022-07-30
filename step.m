function planets = step(universe, planets)
    
    planets = update_system_forces(universe, planets);

    for p = 1:length(planets)
        planets(p).acc = planets(p).current_force ./ planets(p).mass;
        planets(p).vel = planets(p).vel + ((planets(p).acc) * universe.precision);
        planets(p).pos = planets(p).pos + ((planets(p).vel) .* universe.precision);
    end
end