clear;
x=1000; %population size
ns=10; %ns x ns chessboard
for i=1:x
a(i,:)=[randperm(ns)];%%
end
iteration=0;
a1=[randperm(ns)]; %failed offspring
a1=[a1;randperm(ns)];
go=true;
while go
    q=size(a1);     %size off bad offspring population
    for j=1:x
        f(j)= Queenfitness(a(j,:)); %calculating fitness of offsprings
    end
    [w,i1]= sort(f);    %sort the offsprings
    im1=randi(q(1));
    im2=randi(q(1));
    [m,n]= Queencrossover(a(i1(x),:),a(i1(x-1),:)); %crossover between two best chromosomes
    if(randi(10)<9)%%           selecting mutation probablity 9/10
        k=Queenmutation(m); %mutant1
        l=Queenmutation(n); %mutant2
        if(Queenfitness(k)>Queenfitness(m))
            m=k;
        end
        if(Queenfitness(l)>Queenfitness(n))
            n=l;
        end
    end
    for j=1:x
        r(j)= Queenfitness(a(j,:));
    end 
    [b,i2]= sort(r);
    if (Queenfitness(m)>=Queenfitness(a(i2(x),:)))
        if (q(1)<sqrt(x)+1)
        a1 = [a1;a(i2(1),:)];   %move to the week offspring to the bad population set
        end
        a(i2(1),:)=m;           %replace the week offspring by the new born
    end
    if (Queenfitness(n)>=Queenfitness(a(i2(x-1),:)))
        if (q(1)<sqrt(x)+1)
        a1 = [a1;a(i2(1),:)];   %move to the week offspring to the bad population set
        end
        a(i2(2),:)=n;           %replace the week offspring by the new born
    end
    
    iteration=iteration+1;  %iteration
    
    in1=randi(q(1));
    in2=randi(q(1));
    [m,n]= Queencrossover(a1(in1,:),a1(in2,:)); %crossing over between 2 random selected chromosomes in bad population
    if(randi(10)<9)%% mutation
        k=Queenmutation(m);
        l=Queenmutation(n);
        if(Queenfitness(k)>Queenfitness(m))
            m=k;
        end
        if(Queenfitness(l)>Queenfitness(n))
            n=l;
        end
    end
    for j=1:x
        r(j)= Queenfitness(a(j,:));
    end 
    [b,i2]= sort(r);
    if (Queenfitness(m)>=Queenfitness(a(i2(x),:)))
       % if (q(1)<sqrt(x)+1)
       % a1 = [a1;a(i2(1),:)];   %move to the week offspring to the bad population set
       % end
        a(i2(1),:)=m;           %replace the week offspring by the new born
    end
    if (Queenfitness(n)>=Queenfitness(a(i2(x-1),:)))
       % if (q(1)<sqrt(x)+1)
       % a1 = [a1;a(i2(1),:)];   %move to the week offspring to the bad population set
       % end
        a(i2(2),:)=n;           %replace the week offspring by the new born
    end
    
    is1=randi(q(1));
    is2=randi(x);
    [m,n]= Queencrossover(a1(is1,:),a(is2,:)); %crossing over between 2 random selected chromosomes in bad population
    if(randi(10)<9)%% mutation
        k=Queenmutation(m);
        l=Queenmutation(n);
        if(Queenfitness(k)>Queenfitness(m))
            m=k;
        end
        if(Queenfitness(l)>Queenfitness(n))
            n=l;
        end
    end
    for j=1:x
        r(j)= Queenfitness(a(j,:));
    end 
    [b,i2]= sort(r);
    if (Queenfitness(m)>=Queenfitness(a(i2(x),:)))
       % if (q(1)<sqrt(x)+1)
       % a1 = [a1;a(i2(1),:)];   %move to the week offspring to the bad population set
       % end
        a(i2(1),:)=m;           %replace the week offspring by the new born
    end
    if (Queenfitness(n)>=Queenfitness(a(i2(x-1),:)))
       % if (q(1)<sqrt(x)+1)
       % a1 = [a1;a(i2(1),:)];   %move to the week offspring to the bad population set
       % end
        a(i2(2),:)=n;           %replace the week offspring by the new born
    end
    
    if(Queenfitness(a(i2(x),:))==2*ns)
        go = false;         %if one offspring occurs to have the optimal fitness i.e. 2*ns then terminate
    end
end
Q=a(i2(x),:);
