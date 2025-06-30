function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%
hOfX = X * theta;
squared_error = (hOfX - y).^2;
sum_of_squared_error = sum(squared_error);
sum_of_squared_error = (1/(2*m)) * sum_of_squared_error;

temp = theta(2:end); %Not regularizing theta0
squared_theta = (temp).^2;
regularization_term_for_J = (lambda/(2*m)) * sum(squared_theta);

J = (sum_of_squared_error + regularization_term_for_J);

grad = (1/m) * (X'*(hOfX - y));

%Method 1 to calculate grad with regularization
regularization_term_for_grad = (lambda/m) * temp;
grad(2:end) = grad(2:end) + regularization_term_for_grad;

%Method 2 to calculate grad with regularization
% for i = 2 : length(theta)
%     grad(i) = grad(i) + ((lambda/m) * theta(i));
% end
% =========================================================================

grad = grad(:);

end
