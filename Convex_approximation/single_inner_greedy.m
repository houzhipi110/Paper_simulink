function [l,u]=single_inner_greedy(P,x0)
%p为一个方程组Ax=b 
%q=[1 2 3 4]； haha=['A',num2str(2),'=q;'];eval(haha)   妙用

A=[1 2;-2 1];b=[8;0];x0=[1;1]; D=[1,2];M=[1,2];

k=0;

haha=['A',num2str(0),'=A;'];eval(haha); %等价A0=A

haha=['b',num2str(0),'=b-A*x0;'];eval(haha);%等价b0=b-Ax0；

l0=[0,0]; u0=[0,0];% 维数匹配 

haha=['L',num2str(0),'=[];'];eval(haha);%L0=空集
haha=['U',num2str(0),'=[];'];eval(haha);

while ( (~isequal(eval(['L',num2str(k)]),D))  |  (~isequal(eval(['U',num2str(k)]),D)) )
    
    %Proposition 4.
    for  i=1:1:max(M)
                  tao(i)=0;
                 for j=1:1:max(D) 
                 tao(i)=abs(eval(['A',num2str(k),'(i,j)']))+tao(i);
                 end
    end
    
     for i=1:1:max(M)       
                if      (tao(i)>0 )
                    tao(i)=(    eval(['b',num2str(k),'(i,1)'])      )/tao(i);
                else
                    tao(i)=inf;
                 end
     end
        
tp(k+1)=min(tao);% tpk

%transformation(13)
zb=find(tao==tp(k+1));
eval(['M',num2str(k),'=zb'])%M^k

%L^k  i
for i=1:1:max(M);
    eval(['L',num2str(k),num2str(i),'=[]']);%  针对其有没取值时候的情况。
    counts=0;
            for j=1:1:max(D);
                    if(     (eval(['A',num2str(k),'(i,j)'])<0)&   eval(['A',num2str(k),'(zb,j)'])<0          )    %zb=h
                        counts =counts+1;       
                        eval(['L',num2str(k),num2str(i),'(counts)=j']);
                    end
            end
end
% U^k  i
for i=1:1:max(M);
    eval(['U',num2str(k),num2str(i),'=[]']);%  针对其有没取值时候的情况。
    counts=0;
            for j=1:1:max(D);
                    if(     (eval(['A',num2str(k),'(i,j)'])>0)&   eval(['A',num2str(k),'(zb,j)'])>0          )    %zb=h
                        counts =counts+1;       
                        eval(['U',num2str(k),num2str(i),'(counts)=j']);
                    end
            end
end

%a k+1
for i=1:1:max(M);
    for j=1:1:max(D);
        haha=['A',num2str(k),'(i,j)'];
        eval(['A',num2str(k+1),'(i,j)=eval(haha)'])  ; %
    end
end

for i=1:1:max(M);
    for j=1:1:max(D);
        bjL=eval(['L',num2str(k),num2str(i)]);
        bjU=eval(['U',num2str(k),num2str(i)]);
        BJ=union(bjL,bjU);
                if(all(ismember(j,BJ)))  %
                  eval(['A',num2str(k+1),'(i,j)=0'])  ;
                end
    end
end


for i=1:1:max(M);
    
    
   % eval(['b',num2str(k+1),'(i,1)'])
    temp=0;
                for  j=1:1:max(D);
                                    if (ismember(j, bjL))
                                        temp=temp+abs(eval(['A',num2str(k),'(i,j)']));
                                    end
                                    if (ismember(j, bjU))
                                        temp=temp+abs(eval(['A',num2str(k),'(i,j)']));
                                    end
                end
                haha=['b',num2str(k),'(i,1)'];
    eval(['b',num2str(k+1),'(i,1)=eval(haha)-tp(k+1)*temp']);%b^k+1
end

for j=1:1:max(D);
    haha=['l',num2str(k),'(j)'];
     eval(['l',num2str(k+1),'(j)=eval(haha)']);
end
     
haha1=[];
    for i=1:1:max(M);
        
        haha1=union(haha1,eval(['L',num2str(k),num2str(i)]));
    end
    hahaL=haha1;
    
    for  j=1:1:max(D);
                    if(all(ismember(j,haha1)))
                         eval(['l',num2str(k+1),'(j)=-tp(k+1)']);
                    end
    end
     % lk+1 j
     
for j=1:1:max(D);
    haha=['u',num2str(k),'(j)'];
     eval(['u',num2str(k+1),'(j)=eval(haha)']);
end
     
haha1=[];
    for i=1:1:max(M);
        
        haha1=union(haha1,eval(['U',num2str(k),num2str(i)]));
    end
    hahaU=haha1;
    for  j=1:1:max(D);
                    if(all(ismember(j,haha1)))
                         eval(['u',num2str(k+1),'(j)=tp(k+1)']);
                    end
    end
        
    %uk+1 j
    
    %Lk+1
    haha=['L',num2str(k)];
    eval(['L',num2str(k+1),'=union(eval(haha),hahaL)']);
    
     haha=['U',num2str(k)];
    eval(['U',num2str(k+1),'=union(eval(haha),hahaU)']);
k=k+1;


end

l=eval(['l',num2str(k)])
u=eval(['u',num2str(k)])



    
    
    
        
        



