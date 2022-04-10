%Tongji Chen project part 1
% 3(2)Newton with Horner
%open the file and load the data and prepare for write
file=input('Type the name of the input file -> ','s');
fileID=fopen(file,'r');
formatSpec = '%f';
A = fscanf(fileID,formatSpec);
fclose(fileID);
% get the error tolenrence and calculate the maximum iteration time
e = input('\nEnter an error tolerent -> ');
N = round(log2(1/e));
% start from a random value
r0 = rand(1,"double");
r1 = 0;
iteration = 0;
for j=1:N 
    % set data
    p = 0; % P0(x0)
    b = 0; % P1(x0)
    a = A(2:end-1);
    a = flip(a);
    l = length(a);
    c = 0;
    % calculate P0(x0) and P1(x0) by using Horner method
    for i=1:l
        p = p * r0 +a(i);
        a(i) = p;
        c = c + 1;
        if c < l
            b = b * r0 + a(i);
        end
    end
    % Newton method
    r1 = r0-p/b;
    % compare with error tolernence
    if abs(r1-r0) < e
        fprintf(['The solution within the required error tolerance ' ...
            '%f is r=%f\n'],e ,r1);
        break
    end
    r0 = r1;
    iteration = iteration + 1;
    % compare iteration times with the maximum number of iteration
    if iteration == N
        fprintf('the solution was not found')
        break
    end
end
