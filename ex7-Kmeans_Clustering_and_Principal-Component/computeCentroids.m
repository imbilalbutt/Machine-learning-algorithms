function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%

for i =1: K
    %Kitni examples ko assign hva hai: idx == K?
    %Ye basically count save ker raha hai km kitni examples m
    %equal hain to 'K' 
    C_subscript_k = numel(find(idx == i));
    %fprintf("C_subscript_K= ");
    %disp(C_subscript_k);
    
    %Knse wo wale indices hain jahan par idx == K hai?
    %Isme wo wale indicies aa rahe hain, jahan jahan par m == K hai
    indicesVector = find(idx ==i);
    
    %Jitni X ki values assigned hain to K, zahir hai utne ka temp 
    %x_(i) rakh leya.
    x_superscript_i = zeros(C_subscript_k,n);
    %fprintf("IndicesVector= ");
    %disp(indicesVector);
    %fprintf("n = %d", n);
    
    for j = 1: C_subscript_k
        %disp(sumt);
        indx = indicesVector(j);
        %fprintf("\nX= ");
        %disp(X(indx,:));
       x_superscript_i(j,:) = X(indx,:);
    end
    
    x_superscript_i = sum(x_superscript_i);
    centroids(i,:) = ((x_superscript_i)) /C_subscript_k;
end

% =============================================================


end

