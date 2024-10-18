% File name:    ca2_matrices.m
% Instructor-provided script for generating various types of random 
% matrices, for MACM 316 (Fall 2021) Computing Assignment 2.

% You might wish to incorporate the routines below into your code.
% For each computation, be sure to comment out the matrices you don't need.
% Matrix types (i)-(iv) are required for CA2; the remainder are for
% interest/optional.
% 
% Remark: the code below is in part less efficient than it could be, for
% clarity...

% Remember that the matrix size N must always be initialized first!

%% (i) Random matrix, with normally distributed (pseudo)random entries
A = randn(N);           % equivalent to randn(N,N)


%% (ii) Upper triangular matrix
A = randn(N);
A = triu(A);            % extracts the upper triangular part of A


%% (iii) Tridiagonal matrix
A = diag(randn(N-1,1),-1) + diag(randn(N,1)) + diag(randn(N-1,1),1);
                        % creates tridiagonal matrix 

                        
%% (iv) Sparse tridiagonal matrix
B = randn(N,3);         % Nx3 random matrix (columns are 3 random N-vectors)
A = spdiags(B, -1:1, N, N);
                        % create an NxN sparse matrix; use full(A) to see
                        % the entire matrix;
                        % the columns of B = randn(N,3) are placed on the
                        % diagonals +1 (above main diagonal), 0 (main) and
                        % -1 (below main diagonal)


%% (v) Strictly diagonally dominant random matrix
A = randn(N);
diagA = diag(diag(A));  % diagonal matrix containing main diagonal of A
A = A - diagA;          % removes diagonal entries of A
rsumA = sum(abs(A),2);  % row sums of absolute values
A = A + diag(1 + rsumA);    % put (1 + row sum) in each diagonal entry;
                        % creates a strictly diagonally dominant matrix

                        
%% (vi) Symmetric positive definite matrix
C = randn(N);
A = C'*C;               % for any matrix C, the matrix C^T C is symmetric 
                        % and positive definite

                        
%% (vii) Lower triangular matrix
A = randn(N);
A = tril(A);            % extracts the lower triangular part of A


%% (viii) Sparse diagonally dominant tridiagonal matrix
B = randn(N,3);         % see (iv) above for comments
rd = rand(N,1);         % uniformly distributed random numbers in (0,1)
rs = 2*randi([0,1],N,1) - 1;    % vector of random signs (+1 or -1)
b2 = rs.*(abs(B(:,1)) + abs(B(:,3)) + rd);
B(:,2) = b2;            % will put rs(i)*(rd(i) + sum of absolute off-
                        % diagonal terms in row i) in each diagonal entry; 
                        % strictly diagonally dominant, but with somewhat 
                        % more randomness than in (v)
A = spdiags(B, -1:1, N, N);
                        % see (iv) above 
