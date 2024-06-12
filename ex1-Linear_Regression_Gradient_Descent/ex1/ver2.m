

% cd 'D:\Courses\ML\Coursera\Data\Assignments\machine-learning-ex1\machine-learning-ex1\ex1\'

o = [2,1];
t = [ 1; 2];

% o = o';
r = o * t;


fprintf('Program paused. Press enter to continue.\n');
pause;
h = zeros(5,1);

fprintf('Length = %d \n', length(h))

for i = 1: length(h)
    h(i) = i+2;
    fprintf('Result = %d \n', h(i));
end

