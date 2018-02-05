function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

postive_indexes = find(y == 1);
negative_indexes = find(y == 0);

plot(X(postive_indexes, 1), X(postive_indexes, 2), 'g+', 'MarkerSize', 7);
plot(X(negative_indexes, 1), X(negative_indexes, 2), 'ro', 'MarkerSize', 7);


% =========================================================================



hold off;

end
