% Grid Dimensions
r = 500;
c = 500;
cellGrid = cell(500, 500);

numFoxes = 10;
numRabbits = 20;

rabbit_step_size = 2;
fox_step_size = 1;

foxes_array = cell(1, numFoxes);
rabbits_array = cell(1, numRabbits);

% initialise and Spawn Foxes
for i=1:numFoxes
    foxes_array{i} = fox;
    foxes_array{i}.step_size = fox_step_size; % Add class constructor this is ugly as fk
    spawn(foxes_array{i});
end

% initialise and spawn Rabbits
for i=1:numRabbits
    rabbits_array{i} = rabbit;
    rabbits_array{i}.step_size = rabbit_step_size; % Add class constructor this is ugly as fk
    spawn(rabbits_array{i});
end




