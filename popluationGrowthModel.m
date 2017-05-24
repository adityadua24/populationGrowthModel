% Grid Dimensions
rows = 500;
cols = 500;
grid = zeros(rows, cols, 3);
%[dyingSound, Fs] = audioread('aahh.wav'); 

numFoxes = 50;
numRabbits = 50;

rabbit_step_size = 8;
fox_step_size = 4;

foxes_array = cell(1, numFoxes);
rabbits_array = cell(1, numRabbits);

% initialise and Spawn Foxes
for i=1:numFoxes
    foxes_array{i} = fox;
    foxes_array{i}.step_size = fox_step_size; % Add class constructor this is ugly as fk
    spawn(foxes_array{i}, rows);
end

% initialise and spawn Rabbits
for i=1:numRabbits
    rabbits_array{i} = rabbit;
    rabbits_array{i}.step_size = rabbit_step_size; % Add class constructor this is ugly as fk
    rabbits_array{i}.beStill = false;
    spawn(rabbits_array{i}, rows);
end
img = mapToGrid(grid, foxes_array, rabbits_array, numFoxes, numRabbits);
%imshow(img);
% Show the initial frame in the animation
set(figure, 'Visible', 'on', 'Position', get(0,'Screensize'))
set(gcf, 'KeyPressFcn', @KeyPressed) % this allows us to react to any key pressed in the figure window
handle = imshow(img, 'InitialMagnification', 'Fit'); % save the handle for when we want to update the image later
title('Press any key to finish')
drawnow

%while 
%img = mapToGrid(grid, foxes_array, rabbits_array, numFoxes, numRabbits);
%imshow(img, 'InitalMagnification', 'Fit')
done = false;
while ~done
    for i=1:numFoxes
        step(foxes_array{i});
        locationCheck(foxes_array{i});
    end
    for i=1:numRabbits
        step(rabbits_array{i});
        locationCheck(rabbits_array{i});
    end
%     [foxes_array, rabbits_array] = interactionsCheck(foxes_array, rabbits_array);
    interactionsCheck(foxes_array, rabbits_array, numFoxes, numRabbits);
    handle.CData = mapToGrid(grid, foxes_array, rabbits_array, numFoxes, numRabbits);
    drawnow
end
%% This function is the means by which we can intercept a keypress from the user, to stop the loop
function KeyPressed(~, ~)
    % This function is called by MATLAB automatically, whenever the user presses a key in the Figure window.
    % It tells our "while" loop that we're done.
    evalin('base', 'done = true;') % there's a much cleaner way to do this if your M-file is a function, rather than a script
end
