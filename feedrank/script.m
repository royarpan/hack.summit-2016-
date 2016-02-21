%% This logistic regression classifier has been put together
%% from octave scripts developed during the machine learning online class
%% https://www.coursera.org/learn/machine-learning/

%% Initialization
clear ; close all; clc

% Load the Spam Email dataset
% You will have X, y in your environment
load('spamTrain.mat');

%fprintf('\nTraining logistic regression (Spam Classification)\n')

%  Setup the data matrix appropriately, and add ones for the intercept term
[m, n] = size(X);

% Add intercept term to x and X_test
X = [ones(m, 1) X];

% Add Polynomial Features

% Note that mapFeature also adds a column of ones for us, so the intercept
% term is handled
X = mapFeature(X(:,1), X(:,2));

% Initialize fitting parameters
initial_theta = zeros(size(X, 2), 1);

% Set regularization parameter lambda to 1 (you should vary this)
lambda = 5;

% Set Options
options = optimset('GradObj', 'on', 'MaxIter', 400);

% Optimize
[theta, J, exit_flag] = ...
	fminunc(@(t)(costFunctionReg(t, X, y, lambda)), initial_theta, options);

% Plot Boundary
%plotDecisionBoundary(theta, X, y);
%hold on;
%title(sprintf('lambda = %g', lambda))

% Labels and Legend
% xlabel('Spam Data')
% ylabel('Non-spam Data')

% legend('y = 1', 'y = 0', 'Decision boundary')
% hold off;

% Compute accuracy on our training set
p = predict(theta, X);

fprintf('Training Accuracy: %f\n', mean(double(p == y)) * 100);

%fprintf('\nPreprocessing tweet payload\n');

% Extract Features
filename='keywordset.txt';
file_contents = readFile(filename);
word_indices  = processEmail(file_contents);
features=emailFeatures(word_indices);

% Print Stats
%fprintf('Word Indices: \n');
%fprintf(' %d', word_indices);
%fprintf('\n\n');
fprintf('Length of feature vector: %d\n', length(features));
fprintf('Number of non-zero entries: %d\n', sum(features > 0));

p = predict(theta,features);

fprintf('\nProcessed %s\n\nSpam Classification: %d\n', filename, p);
%fprintf('(>0.5 indicates spam, <0.5 indicates non-spam)\n\n');