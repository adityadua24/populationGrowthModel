%function [ foxes_array, rabbits_array ] = interactionsCheck(foxes_array, rabbits_array, numFoxes, numRabbits)
function [foxes_array, rabbits_array, mush_array] = interactionsCheck(foxes_array, rabbits_array, mush_array,rows)    
    for i=1:length(foxes_array)
        selectedFox1 = foxes_array{i};
        if (~selectedFox1.beStill) % if fox is still then go ahead with checks
            for j=1:length(rabbits_array) % check if any fox is next to any rabbit
                selectedRabbit1 = rabbits_array{j};
                interact_fox_rabbit(selectedFox1, selectedRabbit1);
            end
            for k=1:length(foxes_array) % check if any fox is next to other fox
                if i ~= k
                    selectedFox2 = foxes_array{k};
                    interact_foxes_foxes(selectedFox1, selectedFox2);
                end
            end
            for l=1:length(mush_array)
                selectedMush = mush_array{l};
                if ~selectedMush.eaten
                    interact_fox_mushroom(selectedFox1, selectedMush);
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
                    interact_rabbits_rabbits(selectedRabbit2, selectedRabbit3);
                end
            end
            for k=1:length(mush_array)
                selectedMush = mush_array{k};
                if ~selectedMush.eaten
                    interact_rabbit_mushroom(selectedRabbit2, selectedMush);
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
    function reproduce_animal(object)
        if isa(object, 'rabbit')
            rabbits_array{1, end+1} = rabbit;
            rabbits_array{1, end}.step_size = 8;
            spawn(rabbits_array{1, end}, rows);
        elseif isa(object, 'fox')
            foxes_array{1, end+1} = fox;
            foxes_array{1, end}.step_size = 4;
            spawn(foxes_array{1, end}, rows);
        end
    end
    function rabbits_reproduced(rabbit1, rabbit2)
        rabbit1.age = rabbit1.age*1.25;
        rabbit2.age = rabbit2.age*1.25;
        
    end
    function foxes_reproduced(fox1, fox2)
        fox1.age = fox1.age * 1.25;
        fox2.age = fox2.age * 1.25;
    end
    function interact_fox_rabbit(fox1, rabbit1)
        together_rabbits_foxes = false;
        if (~rabbit1.beStill) % do vicinity check only if rabbits is still alive
            together_rabbits_foxes = vicinityCheck(fox1, rabbit1);
        end
        if together_rabbits_foxes && (~rabbit1.didEatMush)
            rabbit1.beStill = true;
            fox1.age = fox1.age ./ 1.25; % if a fox eats a rabbit its age reduces so they live longer
        elseif together_rabbits_foxes && rabbit1.didEatMush
            fox1.beStill = true;
            rabbit1.didEatMush = false;
        end 
    end
    function interact_foxes_foxes(fox1, fox2)
        together_foxes_foxes = false;
        if ~fox2.beStill % Do vicinity check only if fox is still alive
            together_foxes_foxes = vicinityCheck(fox1, fox2);
        end
        probability_reproducing = 0.3;
        if together_foxes_foxes
            if (rand < probability_reproducing) && (length(foxes_array) < 100)
                reproduce_animal(fox2);
                foxes_reproduced(fox1, fox2);
            end
        end
    end
    function interact_rabbits_rabbits(rabbit2, rabbit3)
        together_rabbits_rabbits = false;
        if ~rabbit3.beStill % Do vicinty check only if rabbit is alive
            together_rabbits_rabbits = vicinityCheck(rabbit2, rabbit3);
        end
        probability_reproducing = 0.5;
        if together_rabbits_rabbits
            if (rand < probability_reproducing) && (length(rabbits_array) < 150)
                reproduce_animal(rabbit3);
                rabbits_reproduced(rabbit2, rabbit3); % if rabbits reproduce their ages are doubled so they die sooner
            end
        end
    end
    function interact_fox_mushroom(fox1, mushroom)
        together_fox_mush = false;
        together_fox_mush = vicinityCheck(fox1, mushroom);
        if together_fox_mush
            mushroom.eaten = true;
            fox1.beStill = true;
        end
    end
    function interact_rabbit_mushroom(rabbit1, mushroom)
        together_rabbit_mush = false;
        together_rabbit_mush = vicinityCheck(rabbit1, mushroom);
        if together_rabbit_mush
            mushroom.eaten = true;
            rabbit1.step_size = 10;
            rabbit1.didEatMush = true;
        end
    end
end
% function playDeadSound
% end

