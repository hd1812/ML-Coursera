function [X_rand,y_rand] = randomSample(X,y,i)

    %this function generate randomly selected samples from X and y
    p=randperm(i);
    X_rand=X(p(1:i),:);
    y_rand=y(p(1:i),:);
end