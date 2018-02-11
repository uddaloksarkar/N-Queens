function f= Queenfitness(x)
t1=0;%number of repetative queens in one diagonal while seen from one corner
t2=0;%number of repetative queens in one diagonal while seen from one corner
sz=length(x);
for i= 1:sz;%%
    f1(i)=(x(i)-i);
    f2(i)=((1+sz)-x(i)-i);%%
end
f1=sort(f1);
f2=sort(f2);
for i=2:sz%%
    if(f1(i)==f1(i-1))
        t1=t1+1;
    end
    if(f2(i)==f2(i-1))
        t2=t2+1;
    end
end
f=(sz-t1)+(sz-t2);%%
end