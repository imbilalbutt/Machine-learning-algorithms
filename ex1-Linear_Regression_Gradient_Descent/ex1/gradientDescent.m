function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

% ====================== YOUR CODE HERE ======================
% Instructions: Perform a single gradient step on the parameter vector
%               theta.
%
% Hint: While debugging, it can be useful to print out the values
%       of the cost function (computeCost) and gradient here.
%

hOfx =  X * theta;
    %hOfx =  X * theta;
    thetaChange = (alpha/m) * (X' * (hOfx - y));
    theta = theta - thetaChange;
    
    %{
    k = 1;
    for i = 1:r
        for j = 1:c
            thetaChange(k) = ((hOfx(i)-y(i))* X(i,j));
        end
        thetaChange(k) = (alpha/m) * thetaChange(k);
        if(k == size(theta))
            break;
        end
        k = k+1;
    end
    
    theta = theta - thetaChange
    %}
    
    % 2 cols
    %{
    %{
for i = 1 : m
    for j = 1 : c
        hOfx(i) = hOfx(i) + (theta(j) .* X(i,j)); %j++
        end
    end
    %}
    subtract_hOfi_from_yOfi = zeros(length(y),1);
    
    % for j = 1: m
    %for i = 1: c
    subtract_hOfi_from_yOfi = (X' * (hOfx - y) );
    %end
    %end
    
    sumOfSubtract =  sum(subtract_hOfi_from_yOfi);
    
    theta = theta - (alpha/m) *  sumOfSubtract;
    %}
    
    % ============================================================
    
    % Save the cost J in every iteration
    J_history(iter) = computeCost(X, y, theta);
    
end

end
