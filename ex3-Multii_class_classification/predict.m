function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);


% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%
% Make sure that the the number of columns in the 1st one equals 
% the number of rows in the 2nd one.

%  a_1 = input * Theta1';
%  %a1 =  5000 x 25
%  a_1 = [ones(m, 1) a_1];
%  a_1 = sigmoid(a_1);
%  p = a_1 * Theta2';
%  p = sigmoid(p);

% Theta1 = 25 x 401
% Theta2 = 10 x 26

% X = 5000 x 400
a1 = [ones(m, 1) X];
% a1 = 5000 x 401

% z2 =  5000 x 25
z2 = a1 * Theta1' ;
% z2 =  5000 x 26
a2 = [ones(size(z2, 1), 1) sigmoid(z2)];


z3 = a2 * Theta2';
a3 = sigmoid(z3);

 [p_max, p] =  max(a3, [], 2);
    

% =========================================================================


end
