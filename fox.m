classdef fox < handle
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        location
    end
    
    methods
         function [x, y] = spawn(obj)
             x = randi([1 500]);
             y = randi([1 500]);
             
         end
    end
    
end

