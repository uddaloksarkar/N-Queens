function [m, n]=Queencrossover(y,z)
sz=length(y);
p=randi(sz);%%
go=true;
while(go)
    q=randi(sz);
    if(q~=p)
        go=false;
    end
end
m=zeros(1,sz);
n=zeros(1,sz);
%k=1; 
%l=1;
for h=min(p,q):max(p,q)
    m(h)=y(h);
    n(h)=z(h);
end
for h=1:min(p,q)-1
    k=1;
    while(ismember(z(k),m))
        k=k+1;
    end
    m(h)=z(k);
end

for h=max(p,q)+1:sz
    k=1;
    while(ismember(z(k),m))
        k=k+1;
    end
    m(h)=z(k);
end

for h=1:min(p,q)-1
    k=1;
    while(ismember(y(k),n))
        k=k+1;
    end
    n(h)=y(k);
end

for h=max(p,q)+1:sz
    k=1;
    while(ismember(y(k),n))
        k=k+1;
    end
    n(h)=y(k);
end
%{
for h=1:sz;%%
    for j=1:p-1;
        if(y(h)==z(j))
            m(k)=y(h);
            k=k+1;
        end
        if(z(h)==y(j))
            n(l)=z(h);
            l=l+1;
        end
    end
end
for i=p:sz;%%
    m(i)=z(i);
    n(i)=y(i);
end
end
%}