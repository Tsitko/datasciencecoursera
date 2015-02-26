# Summary
Here will be some useful functions for interpolation

# Content

## Polynom

Make an interpolation for given sets (x and y, where y=f(x)) by polynom

Script:
* polynom.R
_______________________________________________

function bestPolynom(x,y,minN=0,maxN=10):

Input:

* x - points
* y - f(points)
* minN - lowest degree of the interpolation polynomial
* maxN - highest degree of the interpolation polynomial

Output:

The coefficients for the interpolation polynomial that gives the best interpolation

Example:
> x<-0:50      #(51 points from 0 to 50)

> y<-rep(0,51)      #(zero vector of the same length as x)

> for (i in 1:51){y[i]<-sqrt(2500-(x[i]^2))}      #(the circle of radius 50 on [0,50], where y>0.)

>source("polynom.R")

>bestPolynom(x,y)

    Coefficients
X^6     -8.661587e-10

X^5     2.113728e-08

X^4     -1.200492e-06

X^3     7.598625e-07

X^2     -1.000117e-02

X^1     5.908482e-07

X^0     5.000000e+01


That means that the best interpolation is the polynom of 6th degree with given coefficients:

(-8.661587e-10)*x^6+(2.113728e-08)*x^5-(1.200492e-06)*x^4+(7.598625e-07)*x^3-(1.000117e-02)*x^2+(5.908482e-07)*x+50

the integral of this polynom from 0 to 50 (the radius of the circle) is equals to 1967.817 that is pretty close to
2500*pi/4=1963.5 (the area of the quarter of circle with radius 50)

___________________________________________________________________


function plotPolynom(x,y,Coef):

plotting the initial data an the best interpolation polynomial

Input:

* x - points
* y - f(points)
* Coef - Coefficients

Output:

Plotting initial data with points and the polynom with lines
