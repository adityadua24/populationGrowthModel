%% Declarations

rows = 500;
cols = 500;
grid = zeros(rows, cols, 3);

numFoxes = 50;
numRabbits = 50;
numMushrooms = 20;

rabbit_step_size = 8;
fox_step_size = 4;

foxes_array = cell(1, numFoxes);
rabbits_array = cell(1, numRabbits);
mush_array = cell(1, numMushrooms);
%% initialise and Spawn Foxes & Rabbits

% Foxes
for i=1:length(foxes_array)
    foxes_array{i} = fox;
    foxes_array{i}.step_size = fox_step_size; % Add class constructor this is ugly as fk
    spawn(foxes_array{i}, rows);
end

% Rabbits
for i=1:length(rabbits_array)
    rabbits_array{i} = rabbit;
    rabbits_array{i}.step_size = rabbit_step_size; % Add class constructor this is ugly as fk
    spawn(rabbits_array{i}, rows);
end

% deploy magic ,mushrooms
for i=1:length(mush_array)
    mush_array{i} = magic_mushroom;
    spawn(mush_array{i}, rows);
end


%% Initialise Figure

img = mapToGrid(grid, foxes_array, rabbits_array, mush_array);

% Show the initial frame in the animation
set(figure, 'Visible', 'on', 'Position', get(0,'Screensize'))
set(gcf, 'KeyPressFcn', @KeyPressed) % this allows us to react to any key pressed in the figure window
handle = imshow(img, 'InitialMagnification', 'Fit'); % save the handle for when we want to update the image later
title('Press any key to finish')
drawnow

%% video writer
modelVideo = VideoWriter('vid');
open(modelVideo);

%% Run Model
done = false;
while ~done
    
    % Rabbits and Foxes take a step
    for i=1:length(foxes_array)
        step(foxes_array{i});
        locationCheck(foxes_array{i}, rows);
    end
    for i=1:length(rabbits_array)
        step(rabbits_array{i});
        locationCheck(rabbits_array{i}, rows);
    end

    % Check for interactions after change in location
    [foxes_array, rabbits_array, mush_array] = interactionsCheck(foxes_array, rabbits_array, mush_array,rows);
    [foxes_array, rabbits_array, done] = ageCheck(foxes_array, rabbits_array);
    handle.CData = mapToGrid(grid, foxes_array, rabbits_array, mush_array);
    informationString = ['Number of Foxes: ' length(foxes_array)];
    drawnow;
    pull_frame = getframe;
    writeVideo(modelVideo, pull_frame);
end
close(gcf);
close(modelVideo);
%% This function is the means by which we can intercept a keypress from the user, to stop the loop
function KeyPressed(~, ~)
    % This function is called by MATLAB automatically, whenever the user presses a key in the Figure window.
    % It tells our "while" loop that we're done.
    evalin('base', 'done = true;') % there's a much cleaner way to do this if your M-file is a function, rather than a script
end
