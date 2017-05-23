% Grid Dimensions
r = 500;
c = 500;
cellGrid = cell(500, 500);

numFoxes = 10;
numRabits = 20;

foxes = repmat(fox, 1, numFoxes);
%rabbits = rabbit(rabbit, 1, numRabits);

% Spawn Foxes
for i=1:numFoxes
    selectFox = foxes(i);
    fox.spawn(selectFox);
end


