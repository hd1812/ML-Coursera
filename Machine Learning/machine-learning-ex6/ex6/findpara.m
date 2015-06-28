function [C, sigma] = findpara(X, y, Xval, yval)
C=0;
sigma=0;
C_vec=[0.01, 0.03, 0.1, 0.3, 1, 1.3, 10, 30];
sigma_vec=C_vec;
error=inf;
m=size(C_vec,2);
for i = 1 : m
    for j = 1:m
        model= svmTrain(X, y, C_vec(i), @(x1, x2) gaussianKernel(x1, x2, sigma_vec(j)));
        predictions = svmPredict(model, Xval);
        error_i= mean(double(predictions ~= yval));
        if error_i < error 
            error=error_i;
            C=C_vec(i);
            sigma=sigma_vec(j);
        end
    end
end

end