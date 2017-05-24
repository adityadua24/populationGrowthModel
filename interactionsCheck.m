%function [ foxes_array, rabbits_array ] = interactionsCheck(foxes_array, rabbits_array, numFoxes, numRabbits)
function [foxes_array, rabbits_array] = interactionsCheck(foxes_array, rabbits_array, rows)    
    for i=1:length(foxes_array)
        selectedFox1 = foxes_array{i};
        if (~selectedFox1.beStill) % if fox is still then go ahead with checks
            for j=1:length(rabbits_array) % check if any fox is next to any rabbit
                selectedRabbit1 = rabbits_array{j};
                together_rabbits_foxes = false;
                if (~selectedRabbit1.beStill) % do vicinity check only if rabbits is still alive
                    together_rabbits_foxes = vicinityCheck(selectedFox1, selectedRabbit1);
                end
                if together_rabbits_foxes
                    selectedRabbit1.beStill = true;
                    selectedFox1.age = selectedFox1.age ./ 1.25; % if a fox eats a rabbit its age reduces so they live longer
                end
            end
            for k=1:length(foxes_array) % check if any fox is next to other fox
                if i ~= k
                    selectedFox2 = foxes_array{k};
                    together_foxes_foxes = false;
                    if ~selectedFox2.beStill % Do vicinity check only if fox is still alive
                        together_foxes_foxes = vicinityCheck(selectedFox1, selectedFox2);
                    end
                    probability_reproducing = 0.3;
                    if together_foxes_foxes
                        if (rand < probability_reproducing) && (length(foxes_array) < 100)
                            foxes_array{1, end+1} = fox;
                            foxes_array{1, end}.step_size = 4;
                            spawn(foxes_array{1, end}, rows);
                            selectedFox1.age = selectedFox1.age * 1.25; % if foxes reproduce their ages increase so they die sooner
                            selectedFox1.age = selectedFox1.age * 1.25;
                        end
                    end
                end
            end
        end
    end
    for i=1:length(rabbits_array)
        selectedRabbit2 = rabbits_array{i};
        if (~selectedRabbit2.beStill) % Do rabbit still alive then go ahead with the checks
            for j=1:length(rabbits_array) % check if any rabbit is next to other rabbit
                if i ~= j
                    selectedRabbit3 = rabbits_array{j};
                    together_rabbits_rabbits = false;
                    if ~selectedRabbit3.beStill % Do vicinty check only if rabbit is alive
                        together_rabbits_rabbits = vicinityCheck(selectedRabbit2, selectedRabbit3);
                    end
                    probability_reproducing = 0.3;
                    if together_rabbits_rabbits
                        if (rand < probability_reproducing) && (length(rabbits_array) < 150)
                            rabbits_array{1, end+1} = rabbit;
                            rabbits_array{1, end}.step_size = 8;
                            spawn(rabbits_array{1, end}, rows);
                            selectedRabbit2.age = selectedRabbit2.age * 2;
                            selectedRabbit3.age = selectedRabbit3.age * 2; % if rabbits reproduce their ages are doubled so they die sooner
                        end
                    end
                end
            end
        end
    end
    function together_check = vicinityCheck(object1, object2)
        object1X = object1.location(1);
        object1Y = object1.location(2);
        object2X = object2.location(1);
        object2Y = object2.location(2);
        together_check = false;
        if (object1X == object2X) && (object1Y == object2Y)
            together_check = true;
        elseif (object1X == object2X+1) && (object1Y == object2Y+1)
            together_check = true;
        elseif (object1X == object2X+1) && (object1Y == object2Y+0)
            together_check = true;
        elseif (object1X == object2X+1) && (object1Y == object2Y-1)
            together_check = true;
        elseif (object1X == object2X-1) && (object1Y == object2Y+1)
            together_check = true;
        elseif (object1X == object2X-1) && (object1Y == object2Y+0)
            together_check = true;
        elseif (object1X == object2X-1) && (object1Y == object2Y-1)
            together_check = true;
        elseif (object1X == object2X+0) && (object1Y == object2Y+1)
            together_check = true;
        elseif (object1X == object2X+0) && (object1Y == object2Y-1)
            together_check = true;
        end
    end
end
% function playDeadSound
% end

