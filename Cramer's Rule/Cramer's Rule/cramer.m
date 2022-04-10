% 4 Cramer's Rule
% open the file and load the data
file=input('Type the name of the input file -> ','s');
fileID=fopen(file,'r');
formatSpec = '%f';
A = fscanf(fileID,formatSpec);
fclose(fileID);
% set the matrix Ax = b and elements
matrix_size = A(1);
len = length(A);
B = zeros(matrix_size,matrix_size); % A (n*n) matrix
C = zeros(matrix_size,1); % b (n*1) matrix
% meaningless data
E = []; 
x = 2;
y = 1;
m = 1;
n = 1;
k = 1;
answer = 0;
% put A matrix data into B
for i = 1:matrix_size 
    for j = 1:matrix_size 
        B(i,j)=A(x);
        x = x + 1;
    end
end
% put b matrix data into C
for i=x:len
    C(y)=A(i);
    y = y+1;
end
% using Gaussian Elimination to find determinant 
sign = 1;
for i = 1:matrix_size
    % switch the row if A(i,i) zero
    if B(i,i) == 0
        for k = 1:matrix_size
            % change the sign if switch
            if B(k,i) ~= B(i,i) && B(i,i) == 0
                B([i k], :) = B([k i], :);
                sign = -1;
            end
        end
    end
    % Gaussian Elimination
    for j = i+1:matrix_size
        B(j,:) = B(j,:) - B(j,i)/B(i,i) * B(i,:);
    end
end
det = sign;
% calculate the determinant
for i = 1:matrix_size 
    det = det * B(i,i);
end
fprintf('Determinant A = %f\n',det);
% using Gaussian Elimination to find Dx, Dy, Dz
while true
    x = 2;
    answer = 0;
    % reset the matrix to original
    for i = 1:matrix_size 
        for j = 1:matrix_size 
            B(i,j)=A(x);
            x = x + 1;
        end
    end
    if k < matrix_size+1
        % change the column to b
        B(:,k) = C(:,1);
        % using Gaussian Elimination to find determinant 
        sign = 1;
        for l = 1:matrix_size
            % switch the row if A(i,i) zero
            if B(l,l) == 0
                for m = 1:matrix_size
                    % change the sign if switch
                    if B(m,l) ~= B(l,l) && B(l,l) == 0
                        B([l m], :) = B([m l], :);
                        sign = -1;
                    end
                end
            end
            % Gaussian Elimination
            for n = l+1:matrix_size
                B(n,:) = B(n,:) - B(n,l)/B(l,l) * B(l,:);
            end
        end
        % calculate the determinant
        det1 = sign;
        for o = 1:matrix_size 
            det1 = det1 * B(o,o);
        end
        E(k) = det1;
        fprintf('Determinant A%d = %f\n',k,det1);
        k = k+1;
    else
        break
    end
end
% calculate x value
for i = 1:matrix_size
    answer = E(i)/det;
    fprintf('x%d = %f\n',m,answer);
    m = m+1;
end
