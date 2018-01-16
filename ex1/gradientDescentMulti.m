function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
num_features = length(theta);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %
  old_theta = theta;
  for j = 1:num_features
    partial_derivate = sum((X*old_theta - y).*X(:,j));
    partial_derivate = 1/m*partial_derivate;
    theta(j,1) = old_theta(j,1) - alpha * partial_derivate;
  end


    % ============================================================

    % Save the cost J in every iteration    
  iteration_cost = computeCost(X, y, theta);
  disp(sprintf("Cost in %d iteration: %.2f",iter, iteration_cost));
  J_history(iter) = iteration_cost;

end

end
