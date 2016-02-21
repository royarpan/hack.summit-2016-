function g = sigmoid(z)
%% This script was developed during the machine learning online class
%% https://www.coursera.org/learn/machine-learning/
%SIGMOID Compute sigmoid functoon
%   J = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).

g=(1+exp(-z)).^(-1);


% =============================================================

end
