function J = computeCostMulti(X, y, theta)
%COMPUTECOSTMULTI Compute cost for linear regression with multiple variables
%   J = COMPUTECOSTMULTI(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

% Vectorized cost function version
% The sum part is done my multiplying the same vector with it, like doing
% inner product with itself, which is equal to norm_2 squared, ergo, the
% squares sum of each component.

delta_results = X * theta - y % Each component
J = 1/(2*m)*(delta_results' * delta_results) % Summed squared
% =========================================================================

end
