clear all;
close all;

%Sample size
n=1000;

%Training set
x=[rand(n,1).^0.5 abs(rand(n,1)-0.2).^0.7];
y=logical((sign((x-ones(n,1)*[0.5 1/5])*[0;1]).*sign(0.6+randn(n,1))+1)/2);

%Validation set
n2=1000000;
x2=[rand(n2,1).^0.5 abs(rand(n2,1)-0.2).^0.7];
y2=logical((sign((x2-ones(n2,1)*[0.5 1/5])*[0;1]).*sign(0.6+randn(n2,1))+1)/2);

plot(x(y,1),x(y,2),'b.',x(logical(1-y),1),x(logical(1-y),2),'r.');
legend('Y_i=1','Y_i=0');
xlabel('X_1');ylabel('X_2');
title('Training data set');
pause;

%The following line computes the histogram classifier with 64=8*8 bins, it
%outputs both the corresponding empirical risk, and the label corresponding
%to each cell.
[emprisk,c,cvrisk]=hist_classifier(x,y,8)
emprisk
cvrisk
c

%The following line computes an estimate for the true risk of an histogram
%rule, which is defined by the labels of each bin, given by c. It makes use
%of a validation set, as the exact computation of the risk requires the use
%of the exact data distribution.
risk(x2,y2,c)
