>> x = -pi:pi/200:pi;
>> f = zeros(size(x));
>> for n=1:10, f = f+2*(-1)^(n-1)* sin(n*x)/n; end
>> plot(x,x,'f(x)=x',x,f,'s_{20}(x)')
error: __go_line__: set: unknown line property f(x)=x, unable to create graphics handle
error: called from
    __plt__>__plt2vv__ at line 500 column 10
    __plt__>__plt2__ at line 247 column 14
    __plt__ at line 132 column 16
    plot at line 229 column 10
>> plot(x,x,label='f(x)=x',x,f,label='s_{20}(x)')
error: __go_line__: set: unknown line property f(x)=x, unable to create graphics handle
error: called from
    __plt__>__plt2vv__ at line 500 column 10
    __plt__>__plt2__ at line 247 column 14
    __plt__ at line 132 column 16
    plot at line 229 column 10
>> plot(x,x,x,f)
>> f = zeros(size(x));
>> for n=1:40, f = f+2*(-1)^(n-1)* sin(n*x)/n; end
>> plot(x,x,x,f)
>> g = @(x) x.*(pi-x).*(pi+x);
>> nn = 1:40;
>> for n=nn, c(n)=integral(@(x) pi^-0.5 * g(x) .* sin(n*x), -pi, pi); end
>> s40 = zeros(size(x));
>> for n=nn, s40 = s40 + c(n) * pi^-0.5 * sin(n*x); end
>> plot(x,x,x,g)
error: __go_line__: invalid value for array property "ydata", unable to create graphics handle
error: called from
    __plt__>__plt2vs__ at line 466 column 15
    __plt__>__plt2__ at line 245 column 14
    __plt__ at line 112 column 18
    plot at line 229 column 10
>> plot(x,g(x),x,s40)
>> s = zeros(size(x));
>> plot(x,g(x),x,c(1) * pi^-0.5 * sin(x))
>> plot(x,g(x),x,c(1) * pi^-0.5 * sin(x) + c(2) * pi^-0.5 * sin(2*x))
>> plot(x,g(x),x,c(1) * pi^-0.5 * sin(x) + c(2) * pi^-0.5 * sin(2*x) + c(3) * pi^-0.5 * sin(3*x))
>> format long
>> c(1:5)'
ans =

  1.0e+01 *

   2.126944621086619
  -0.265868077635827
   0.078775726706911
  -0.033233509704478
   0.017015556968693

>> format long g
>> c(1:5)'
ans =

       21.26944621086619
      -2.658680776358274
      0.7877572670691135
     -0.3323350970447809
      0.1701555696869275

>> nn = 1:5;  2*(-1).^(nn-1) ./ nn
ans =

 Columns 1 through 4:

                       2                      -1      0.6666666666666666                    -0.5

 Column 5:

                     0.4

>> nn = 1:5;  (2*(-1).^(nn-1) ./ nn)'
ans =

