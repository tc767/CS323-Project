%Tongji Chen project part 1
% 3(1)Horner
%open the file and load the data and prepare for write
file=input('Type the name of the input file -> ','s');
fileID=fopen(file,'r');
formatSpec = '%f';
A = fscanf(fileID,formatSpec);
fclose(fileID);
% get the highest degree, x0, 
% and the coeffients array a(from high degree to low degree)
degree = A(1);
x0 = A(end);
a = A(2:end-1);
a = flip(a);
% n is just for accounting the number of derivative
n = 0;
l = length(a);
% reduce the degree to zero
for j = degree:-1:0
    p = 0;
    % calculate Pn(x0) by using Horner method
    for i=1:l
        p = p * x0 +a(i);
        a(i) = p;
    end
    p = factorial(n) * p;
    fprintf('P%d(x0)=%f\n',n,p);
    n = n+1;
    l = l - 1;
end