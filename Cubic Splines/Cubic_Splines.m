%% Cubic Splines
%Tongji Chen
%1(a)
function Cubic_Splines(file)
%open the file
myfile=fopen(file);
%read the elements in the file
number_of_points = fscanf(myfile, '%f', 1);
x = zeros(number_of_points, 1);
y = zeros(number_of_points, 1);
for i = 1:number_of_points 
    x(i, 1) = fscanf(myfile, '%f', 1);
    y(i, 1) = fscanf(myfile, '%f', 1);
end
%set h and a
a = y;
h = zeros(number_of_points-1, 1);
for i = 1:number_of_points-1 
    h(i, 1) = x(i+1, 1) - x(i, 1);
end
%system of equations in matrix form
M = zeros(number_of_points);
N = zeros(number_of_points, 1); 
for i = 1:number_of_points
    if i == 1 
        M(i,1) = 1;
        N(i,1) = 0;
    elseif i == number_of_points 
        M(i, number_of_points) = 1;
        N(i, 1) = 0;
    else
        M(i, i-1) = h(i-1,1);
        M(i, i) = 2*(h(i-1, 1)+h(i,1));
        M(i, i+1) = h(i,1);
        N(i, 1) = 3/h(i, 1)*(a(i+1,1)-a(i))-3/h(i-1, 1)*(a(i, 1)-a(i-1, 1));
    end
end
%calculate c
M = inv(M);
c = M*N;
%calculate b
b = zeros(number_of_points, 1);
for i = 1:number_of_points-1
    b(i, 1) = (a(i+1, 1)-a(i, 1))/h(i, 1)-(2*c(i, 1)+c(i+1, 1))/3*h(i, 1);
end
%calculate d
d = zeros(number_of_points, 1);
for i = 1:number_of_points-1 
    d(i, 1) = 1/(3*h(i, 1))*(c(i+1, 1)-c(i, 1));
end
%display the answer
for i = 1:number_of_points-1
    fprintf('%f %f %f %f\n',a(i,1), b(i,1),c(i,1),d(i,1));
end
%1(b)
for i = 1:number_of_points-1
    xx = linspace(x(i,1),x(i+1,1));
    y=a(i,1)+b(i,1)*(xx-x(i,1))+c(i,1)*(xx-x(i,1)).^2+d(i,1)*(xx-x(i,1)).^3;
    plot(xx,y);hold on; grid on;
end