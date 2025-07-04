function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples
%You need to return the following variables correctly
J = zeros(length(y),1);
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.
%

%hOfx = zeros(length(y),1) ; % 2 length
hOfX =  X * theta;

J = (hOfX - y).^2;
J = sum(J) / (2*m);
%fprintf('Result Of J(theta) = %f', J);
% =========================================================================

end
