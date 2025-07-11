
function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
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
%
% Hint: The computation of the cost function and gradients can be
%       efficiently vectorized. For example, consider the computation
%
%           sigmoid(X * theta)
%
%       Each row of the resulting matrix will contain the value of the
%       prediction for that example. You can make use of this to vectorize
%       the cost function and gradient computations.
%
% Hint: When computing the gradient of the regularized cost function,
%       there're many possible vectorized solutions, but one solution
%       looks like:
%           grad = (unregularized gradient for logistic regression)
%           temp = theta;
%           temp(1) = 0;   % because we don't add anything for j = 0
%           grad = grad + YOUR_CODE_HERE (using the temp variable)
%
%% %%
% Hypothesis For Logistic Regression.
% Method 1
hOfX = sigmoid(X*theta);
% Method 2
% dotProduct = X * theta;
% hOfX = zeros(length(y),1);
% for i = 1: length(y)
%     hOfX(i) = sigmoid(dotProduct(i));
% end
%% %%
%$ Method 1
%      regularTermOfThetaToAddInCostFunc = 0;
%      thetaSqr = theta.^2; 
%      regularTermOfThetaToAddInCostFunc = ((lambda/(2*m)) .* thetaSqr);
%      regularTermOfThetaToAddInCostFunc = (sum(regularTermOfThetaToAddInCostFunc));
%$ Method 2
   
   regularTermOfThetaToAddInCostFunc = 0;
   for i = 2: length(theta)
       regularTermOfThetaToAddInCostFunc = regularTermOfThetaToAddInCostFunc + theta(i)^2;
   end
   regularTermOfThetaToAddInCostFunc = (lambda/(2*m)) * regularTermOfThetaToAddInCostFunc;
%%
%* Vector Implementation of J(0)
%Gives Cost Function (without regularization)
J = (1/m) * (-(y)'*log(hOfX) - (1-y)'*log(1-hOfX)); 
%Gives Cost Function (without regularization)
J = J + regularTermOfThetaToAddInCostFunc; 

%* Vector Implementation of Gradient Descent
beta = hOfX - y; 
%Gives Gradient Descent (without regularization)
grad = (1/m) * (X' * beta);
%Gives Gradient Descent (with regularization)
for i = 2 : length(theta)
    grad(i) = grad(i) + ((lambda/m) * theta(i));
end
% =============================================================

grad = grad(:);
%%
end
