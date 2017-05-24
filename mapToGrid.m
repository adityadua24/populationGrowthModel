function img = mapToGrid(grid, foxes_array, rabbits_array)

% map a fox to grid if its alive
for i = 1:length(foxes_array)
    if ~foxes_array{i}.beStill
        x = foxes_array{i}.location(1);
        y = foxes_array{i}.location(2);
        grid(x, y, 1) = 255;
        grid(x+1, y+1, 1) = 255;
        grid(x+1, y, 1) = 255;
        grid(x, y+1, 1) = 255;
    end  
end

% map a rabbit to grid if its alive
for i=1:length(rabbits_array)
    if ~rabbits_array{i}.beStill
        x = rabbits_array{i}.location(1);
        y = rabbits_array{i}.location(2);
        grid(x, y, 2) = 255;
        grid(x+1, y+1, 2) = 255;
        grid(x+1, y, 2) = 255;
        grid(x, y+1, 2) = 255;
    end
end
img = uint8(grid);
end

