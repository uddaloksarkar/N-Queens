function y=Queenmutation(y)
sz=length(y);
p= randi(sz);%%
q= randi(sz);%%
t=y(p);
y(p)=y(q);
y(q)=t;
if (randi(2)==1)   %0.5 probablity of double mutation
    p= randi(sz);%%
    q= randi(sz);%%
    t=y(p);
    y(p)=y(q);
    y(q)=t; 
end
end
