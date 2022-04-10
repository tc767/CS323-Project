%% Nevilles Method

% pass the file from the command line
% example:
% >> Nevilles
% Type the name of the input file -> Neville'sInput1.txt
% Type the name of the input file -> Neville'sInput2.txt
% Type the name of the input file -> Neville'sInput3.txt
% Type the name of the input file -> Neville'sInput4.txt
% Type the name of the input file -> Neville'sInput5.txt
file=input('Type the name of the input file -> ','s');
myfile=fopen(file,'r');
n=fscanf(myfile, '%f', 1);

% initialize the matrix from the data
P=zeros(n+1, n+1);

% initialize x values to a vector
x_vector = zeros(1, n+1);

% fill the matrix P by Xs and f(x)s
for i=1:n+1
    x_vector(1, i)=fscanf(myfile, '%f', 1);
    P(i, i)=fscanf(myfile, '%f', 1);
end

% read the last line storing x
x=fscanf(myfile, '%f', 1);

% main function of Neville's method
% perform diagonally
for d=1:n+1
    for i=1:(n+1)-d
        j=i+d;

        P(i ,j) = ((x - x_vector(i))*P(i+1, j) - (x - x_vector(j))*P(i, j-1)) / (x_vector(j) - x_vector(i));
    end
end

% output
fprintf('P(%f) = %f\n',x,P(1, n+1));
