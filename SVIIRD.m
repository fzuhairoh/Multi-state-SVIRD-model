clear
set(0,"DefaultAxesFontSize", 12);
set(gca,"fontsize",12);
beta=0.3382848; 
gamma=0.3386960;
eta=0.6618879;
delta=0.6619034;
alpha=0.4587398;
theta=0.5263982;
%N=276361788;
N=700000;
time=50;
clear t s v is id r d
t(1)=0;
r(1)=10708;
d(1)=82;
v(1)=38694;
is(1)=17595;
iv(1)=8526;
j=1;
s(1)=1000000;
while (is(j)+iv(j))>0 & t(j)<time
u1=rand; % uniform random number
u2=rand; % uniform random number
p1=(eta*s(j))/((eta*s(j))+((1-delta/N)*beta*iv(j)*v(j))+(gamma*iv(j)));
p2=((beta/N)*is(j)*s(j))/((beta/N)*is(j)*s(j))+(theta*is(j))+(alpha*is(j));
p3=((1-delta/N)*beta*iv(j)*v(j))/((eta*s(j))+((1-delta/N)*beta*iv(j)*v(j))+(gamma*iv(j)));
p4=(theta*is(j))/(((beta/N)*is(j)*s(j))+(theta*is(j)));
p5=(gamma*iv(j))/((eta*s(j))+((1-delta/N)*beta*iv(j)*v(j))+(gamma*iv(j)));
p6=(alpha*is(j))/(((beta/N)*is(j)*s(j))+(alpha*is(j)));
t(j+1)=t(j)-(log(u2)/((eta*s(j))+((1-delta/N)*beta*iv(j)*v(j))+(gamma*iv(j))))-(log(u2)/(((beta/N)*is(j)*s(j))+(theta*is(j))))-(log(u2)/(((beta/N)*is(j)*s(j))+(alpha*is(j))));
if  0 < u1 <= p1
    s(j+1)=s(j)-1;
    v(j+1)=v(j)+1;
    iv(j+1)=iv(j);
    r(j+1)=r(j);
elseif  p1 < u1 <= p3
        s(j+1)=s(j);
        v(j+1)=v(j)-1;
        iv(j+1)=iv(j)+1;
        r(j+1)=r(j);
else p3 < u1 <= 1
        s(j+1)=s(j);
        v(j+1)=v(j);
        iv(j+1)=iv(j)-1;
        r(j+1)=r(j)+1;
end
if  0 < u1 <= p2
    s(j+1)=s(j)-1;
    is(j+1)=is(j)+1;
    r(j+1)=r(j);
else
    p2 < u1 <= 1
    s(j+1)=s(j);
    is(j+1)=is(j)-1;
    r(j+1)=r(j)+1;
end
if  0 < u1 <= p2
    s(j+1)=s(j)-1;
    is(j+1)=is(j)+1;
    d(j+1)=d(j);
else p2 < u1 <= 1
        s(j+1)=s(j);
        is(j+1)=is(j)-1;
        d(j+1)=d(j)+1;
end
j=j+1;
end
stairs(t,(is+iv),"r-","LineWidth",2)
hold on
fontSize = 12; 
xlabel("Time",'FontSize' , fontSize);
ylabel("Number of Infectives",'FontSize' , fontSize);
title("INDONESIA",'FontSize' , fontSize);
hold off
