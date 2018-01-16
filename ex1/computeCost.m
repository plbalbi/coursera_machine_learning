function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression

%X in R( m )*( n+1 )
%y in R( m )*1
%theta in R( n+1 )*1
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

deltaResults = X*theta - y; % diff between estimation and target variables
deltaResults = deltaResults .^2; % squared difference
J = sum(deltaResults);
J = J*(1/(2*m));


% =========================================================================

end
