classdef magic_mushroom < handle
    properties
        location
        alive = true
        eaten = false
    end
     methods
         function spawn(obj, rows)
             obj.location = [randi([1 rows]) randi([1 rows])];      
         end
     end
    
end