function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

C_params_list = [];
sigma_params_list = [];
PAR_COUNT=8;
for i=0:(PAR_COUNT-1)
	curr_value = 0.01*3^i;
	C_params_list = [C_params_list; curr_value];
	sigma_params_list = [sigma_params_list; curr_value];
end

fprintf('Will train with following params\n');

fprintf('C list: ');display(C_params_list);
fprintf('sigma list: ');display(sigma_params_list);

results_matrix = zeros(PAR_COUNT,PAR_COUNT);
for i=1:PAR_COUNT
	C_current = C_params_list(i);
	for j=1:PAR_COUNT
		sigma_curr = sigma_params_list(j);
		fprintf('Calculating error for C=%.2f, SIGMA=%.2f',C_current,sigma_curr);

		model= svmTrain(X, y, C_current, @(x1, x2) gaussianKernel(x1, x2, sigma_curr));
		predictions = svmPredict(model, Xval);

		results_matrix(i,j) = mean(double( predictions ~= yval));
		fprintf('Error found: %.4f\n\n', results_matrix(i,j));
	end
end

fprintf('ErrorMatrix: \n');
display(results_matrix);

% Find minimums across errors matrix
[min_error, me_row] = min(min(results_matrix, [], 1));
[min_error, me_col] = min(min(results_matrix, [], 2));

fprintf('The minimum error is %.4f, with parameters\nC=%.2f\nsigma=%.2f',...
	min_error, C_params_list(me_row), sigma_params_list(me_col));

% Save return paramaters
C = C_params_list(me_row); sigma = sigma_params_list(me_col);
% =========================================================================

end
