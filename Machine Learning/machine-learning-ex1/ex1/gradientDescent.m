function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
theta_i=theta;
for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    gradient1=0;
    for i=1:m
        gradient1=(theta'*X(i,:)'-y(i))*X(i,1)+gradient1;
    end
    gradient1=gradient1/m;
    
    theta_i(1)=theta(1)-alpha*gradient1;

    gradient2=0;
    for i=1:m
        gradient2=(theta'*X(i,:)'-y(i))*X(i,2)+gradient2;
    end
    gradient2=gradient2/m;
    
    theta_i(2)=theta(2)-alpha*gradient2;

    theta=theta_i;


    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);
   % J_history(iter)
end

end
