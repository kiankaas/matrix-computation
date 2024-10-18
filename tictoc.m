% File name:    tictoc.m
%
% MACM 316 demo - computational time
% Description:  Finds the mean computation time for Gaussian elimination 
%               (using backslash) on a random matrix
% Reference:    Sections 2.3, 2.9 of lecture notes (MACM 316, Fall 2021)
% Instructor:   Ralf Wittenberg

trials = 50;            % Number of trials
N = 2000;               % Matrix size
times = zeros(trials,1);    % Initialize array of timing data

for i=1:trials
    
    % Form a random matrix A and right-hand side b (normally distributed)
    A = randn(N,N);
    b = randn(N,1);
    
    % Apply backslash and calculate time taken
    tic;
    x = A\b;
    times(i) = toc;
    
end

mean_time = mean(times);
disp(['N = ' num2str(N) ', mean time = ' num2str(mean_time,4)])