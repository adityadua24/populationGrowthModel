% Grid Dimensions
rows = 500;
cols = 500;
grid = zeros(rows, cols, 3);

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
    spawn(foxes_array{i}, rows, cols);
end

% initialise and spawn Rabbits
for i=1:numRabbits
    rabbits_array{i} = rabbit;
    rabbits_array{i}.step_size = rabbit_step_size; % Add class constructor this is ugly as fk
    spawn(rabbits_array{i}, rows, cols);
end

% Run model
% done = false;
% while ~done
%     
% end
img = mapToGrid(grid, foxes_array, rabbits_array, numFoxes, numRabbits, rows, cols);
imshow(img)
%% This function is the means by which we can intercept a keypress from the user, to stop the loop
function KeyPressed(~, ~)
    % This function is called by MATLAB automatically, whenever the user presses a key in the Figure window.
    % It tells our "while" loop that we're done.
    evalin('base', 'done = true;') % there's a much cleaner way to do this if your M-file is a function, rather than a script
end

%% Mapping

function img = mapToGrid(grid, foxes_array, rabbits_array, numFoxes, numRabbits, rows, cols)
for i = 1:numFoxes
    x = foxes_array{i}.location(1);
    y = foxes_array{i}.location(2);
    grid(x, y, 1) = 255;
end
for i=1:numRabbits
    x = rabbits_array{i}.location(1);
    y = rabbits_array{i}.location(2);
    grid(x, y, 2) = 255;
end
img = uint8(grid);
end
