classdef rabbit < handle
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        location
        step_size
    end
    
    methods
        function spawn(obj)
             obj.location = [randi([1 500]) randi([1 500])];      
        end
        function step(obj)
             r = rand;
             if (r > 0) && (r <= 0.125)
                 obj.location(2) = obj.location(2) + obj.step_size; % y++
             elseif (r > 0.125) && (r <= 0.250)
                 obj.location(2) = obj.location(2) + obj.step_size; % y++
                 obj.location(1) = obj.location(1) + obj.step_size; % x++
             elseif (r > 0.250) && (r <= 0.375)
                 obj.location(1) = obj.location(1) + obj.step_size; % x++
             elseif (r > 0.375) && (r <= 0.500)
                 obj.location(1) = obj.location(1) + obj.step_size; % x++
                 obj.location(2) = obj.location(2) - obj.step_size; % y--
             elseif (r > 0.500) && (r <= 0.625)
                 obj.location(2) = obj.location(2) - obj.step_size; % y--
             elseif (r > 0.625) && (r <= 0.750)
                 obj.location(2) = obj.location(2) - obj.step_size; % y--
                 obj.location(1) = obj.location(1) - obj.step_size; % x--
             elseif (r > 0.750) && (r <= 0.875)
                 obj.location(1) = obj.location(1) - obj.step_size; % x--
             else
                 obj.location(2) = obj.location(2) + obj.step_size; % y++
                 obj.location(1) = obj.location(1) - obj.step_size; % x--
             end
         end
    end
    
end
