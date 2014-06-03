%%this function finds the maxima for a matrix wherein it ignores the
%%differences less than of or equal to a pre determined value(this is for
%%dealing with the problems that I face when the center of mass is not at
%%the maximal intensity and hence the covariance does not exactly
%%correspond to the point of maxima, just improving the measure of
%%distances between my maximas

%%THE THRESHOLD TAKEN in the problem will itself be the value that we use
%%as the magnitude of the steps at which to change the maxima

function [max_x i] = max_modified(x)
max_x=x(1);
for i=1:length(x)
    if x(i)>max_x*(1.2)%just trying here, this seems like a big value but it is the threshold that I used
        max_x=x(i);
    end
end