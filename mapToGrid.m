function img = mapToGrid(grid, foxes_array, rabbits_array)
for i = 1:length(foxes_array)
    x = foxes_array{i}.location(1);
    y = foxes_array{i}.location(2);
    grid(x, y, 1) = 255;
    grid(x+1, y+1, 1) = 255;
    grid(x+1, y, 1) = 255;
    grid(x, y+1, 1) = 255;
    
end
for i=1:length(rabbits_array)
    if ~rabbits_array{i}.beStill
        x = rabbits_array{i}.location(1);
        y = rabbits_array{i}.location(2);
        grid(x, y, 2) = 255;
        grid(x+1, y+1, 2) = 255;
        grid(x+1, y, 2) = 255;
        grid(x, y+1, 2) = 255;
    else
        % Do nothing
    end
end
img = uint8(grid);
end

