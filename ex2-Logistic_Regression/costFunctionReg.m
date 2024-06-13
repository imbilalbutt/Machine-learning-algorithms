function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

% Calculate J and gradient without Regularization term
[J,grad] = costFunction(theta, X, y);

% Regularized Cost For Logistic Regression.
% Method 1
%sumOfTheta = 0;
%for i = 2: length(theta)
%    sumOfTheta = sumOfTheta + theta(i)^2;
%end
%sumOfTheta = (lambda/(2*m)) * sumOfTheta;

% Regularized Cost For Logistic Regression.
% Method 2
temp = theta(2:end);
tmp = temp' * temp;
sumOfTheta = (lambda/(2*m)) * sum(tmp);

J = J + sumOfTheta;

% Regularized Gradient For Logistic Regression.

%thetaSum = sum(theta) - theta(1);
%sumForGradient = (lambda/m) * thetaSum;

%thetaChange = (1/m) * (X'*(hOfX - y)) + sumForGradient;
%grad = grad + sumForGradient;

% Gradient for Logistic Regression
for i = 2 : length(theta)
    grad(i) = grad(i) + ((lambda/m) * theta(i));
end

% =============================================================

end
