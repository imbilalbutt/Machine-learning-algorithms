function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly
%J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%

%Cost function for Logistic Regression
dotProduct = X * theta;
hOfX = sigmoid(dotProduct);

J = (1/m) * (-(y') * log(hOfX) - (1-y)' * log(1-hOfX));
grad = (1/m) * (X'*(hOfX - y));

% =============================================================

end

%V = A(1,:);
%{
   * extract first row from A and save into V
%}
