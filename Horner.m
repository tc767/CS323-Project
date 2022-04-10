clear;
% pass the file from command line
file=input('Type the name of the input file -> ','s');
myfile=fopen(file,'r');
degree=fscanf(myfile, '%f', 1);
% initilize an array to store coefficients
coefficients=zeros(1,degree);
for i=1:(degree+1)
    coefficients(i)=fscanf(myfile, '%f', 1);
end
x0=fscanf(myfile, '%f', 1);
a=coefficients(degree+1);
b=coefficients(degree+1);
for i=(degree-1):-1:0
    a=a*x0+coefficients(i+1);
    if i > 0
        b=b*x0+a;
    end
end
disp([a b]);

