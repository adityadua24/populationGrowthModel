function [ foxes_array, rabbits_array, everyoneDead ] = ageCheck( foxes_array, rabbits_array )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
everyoneDead = true;
for i = 1:length(foxes_array)
    if foxes_array{i}.age >= 1000
        foxes_array{i}.beStill = true;
    else
        everyoneDead = false;
    end
end


for i = 1:length(rabbits_array)
    if rabbits_array{i}.age >= 1000
        rabbits_array{i}.beStill = true;
    else
        everyoneDead = false;
    end
end
end

