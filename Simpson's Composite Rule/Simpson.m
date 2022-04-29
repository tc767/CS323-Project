%% Composite Simpson's Rule

% pass the file from the command line
% example:
% >> Simpson(SimpsonInput1.txt)
% >> Simpson(SimpsonInput2.txt)
% >> Simpson(SimpsonInput3.txt)
% >> Simpson(SimpsonInput4.txt)
% >> Simpson(SimpsonInput5.txt)
function Simpson(file)

myfile=fopen(file,'r');

% Read from the file and store 
% input function, 
% upper and lower bound,
% number of subintervals
fun=fscanf(myfile, '%s', 1);
a=fscanf(myfile, '%f', 1);
b=fscanf(myfile, '%f', 1);
n=fscanf(myfile, '%f', 1);
if (mod(n, 2) == 1)
    fprintf('[Error]: Your input N is an odd number, %f, please input an even number\n', n);
    return;
end


% Convert the input function of x 
% from string to a function 
% that can be evaluated by matlab
func=inline(fun);
h=(b-a)/n;


fx0=func(a);
fxn=func(b);
oddres=0; % Initialize the results with odd indexes
evenres=0; % Initialize the results with even indexes
for i=1:n-1
    % Check if the index is even or odd
    if (mod(i, 2) == 0)
        % Calculate and add up the result by every step h
        evenres = evenres + func(a + i*h);
    else
        oddres = oddres + func(a + i*h);
    end
end

% Add up the components by Simpson's Composite Rule
finalres = (h/3)*(fx0 + 2*evenres + 4*oddres + fxn);
fprintf('The approximate value is %f\n', finalres);