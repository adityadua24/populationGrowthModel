%function [ foxes_array, rabbits_array ] = interactionsCheck(foxes_array, rabbits_array, numFoxes, numRabbits)
function interactionsCheck(foxes_array, rabbits_array, numFoxes, numRabbits)    
    for i=1:numFoxes
        selectedFox = foxes_array{i};
        for j=1:numRabbits
            selectedRabbit = rabbits_array{j};
            selectedRabbitX = selectedRabbit.location(1);
            selectedRabbitY = selectedRabbit.location(2);
            if (selectedFox.location(1) == selectedRabbitX+1) && (selectedFox.location(2) == selectedRabbitY+1)
                selectedRabbit.beStill = true;
                %playDeadSound();
            elseif (selectedFox.location(1) == selectedRabbitX+1) && (selectedFox.location(2) == selectedRabbitY-1)
                selectedRabbit.beStill = true;
            elseif (selectedFox.location(1) == selectedRabbitX+1) && (selectedFox.location(2) == selectedRabbitY+0)
                selectedRabbit.beStill = true;
            elseif (selectedFox.location(1) == selectedRabbitX-1) && (selectedFox.location(2) == selectedRabbitY+1)
                selectedRabbit.beStill = true;
            elseif (selectedFox.location(1) == selectedRabbitX-1) && (selectedFox.location(2) == selectedRabbitY-1)
                selectedRabbit.beStill = true;
            elseif (selectedFox.location(1) == selectedRabbitX-1) && (selectedFox.location(2) == selectedRabbitY+0)
                selectedRabbit.beStill = true;
            elseif (selectedFox.location(1) == selectedRabbitX+0) && (selectedFox.location(2) == selectedRabbitY+1)
                selectedRabbit.beStill = true;
            elseif (selectedFox.location(1) == selectedRabbitX+0) && (selectedFox.location(2) == selectedRabbitY-1)
                selectedRabbit.beStill = true;
            elseif (selectedFox.location(1) == selectedRabbitX) && (selectedFox.location(2) == selectedRabbitY)
                selectedRabbit.beStill = true;
            end
        end
    end
end
% function playDeadSound
% end

