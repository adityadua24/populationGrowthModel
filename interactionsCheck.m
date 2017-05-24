%function [ foxes_array, rabbits_array ] = interactionsCheck(foxes_array, rabbits_array, numFoxes, numRabbits)
function [foxes_array, rabbits_array] = interactionsCheck(foxes_array, rabbits_array, rows)    
    for i=1:length(foxes_array)
        selectedFox1 = foxes_array{i};
        for j=1:length(rabbits_array)
            selectedRabbit = rabbits_array{j};
            together_rabbits_foxes = vicinityCheck(selectedFox1, selectedRabbit);
            if together_rabbits_foxes
                selectedRabbit.beStill = true;
            end
        end
        for k=1:length(foxes_array)
            if i ~= k
                selectedFox2 = foxes_array{k};
                together_foxes_foxes = vicinityCheck(selectedFox1, selectedFox2);
                if together_foxes_foxes
                    foxes_array{1, end+1} = fox;
                    foxes_array{1, end}.step_size = 4;
                    spawn(foxes_array{1, end}, rows);
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

