function I=multi_inner(P)

B=single_inner_greedy(P,x0);
e=1;d=max(D);

if  vol(B)>e
    Iodd=[]; Ieven=[];


for k=1:1:d;
    %(21)
    counts=0;temp=0;
    for i=1:1:max(M);
        while(A(i,k)<0);
            counts=counts+1;
                    for j=1:1:max(D)
                        xc(j)=(u(j)+l(j))/2;
                        temp=temp+A(i,j)*xc(j);
                    end
            haha(counts)=(b(i,1)-temp)/A(i,k);
        end
    end
    lambda(2k-1)=max(haha)+(u(k)-l(k))/2;
   
    
    counts=0;temp=0;
    for i=1:1:max(M);
        while(A(i,k)>0);
            counts=counts+1;
                    for j=1:1:max(D)
                        xc(j)=(u(j)+l(j))/2;
                        temp=temp+A(i,j)*xc(j);
                    end
            haha(counts)=(b(i,1)-temp)/A(i,k);
        end
    end
    lambda(2k)=min(haha)-(u(k)-l(k))/2;
    
    %h的区域表示 {x属于Rd：lj《=xj《=uj} 
    if    lambda(2k-1)<l(k)
        counts=0;
       for j=1:1:k-1
           if (l(j)<=x(j)<=u(j)
               counts=counts+1;
               H(2k-1,counts)=x(j);
           end
       end
       if x(k)<=l(k);
            counts=counts+1;
               H(2k-1,counts)=x(k);
       end
   
       
       %P需要更详细的描述
       
       P(2k-1)= intersect(P,H(2k-1));
       Iodd=union(Iodd,multi_inner(P(2k-1)));
    end
       
       if  lambda(2k)>u(k)
           
              counts=0;
       for j=1:1:k-1
           if (l(j)<=x(j)<=u(j)
               counts=counts+1;
               H(2k,counts)=x(j);
           end
       end
       if x(k)>=u(k);
            counts=counts+1;
               H(2k,counts)=x(k);
       end
       
       P(2k)= intersect(P,H(2k));
       Ieven=union(Ieven,multi_inner(P(2k)));
       end
end

return(union(union(Iodd,Ieven),B));

else 
    return [nan];
end




       
      
           
               
    %
    
    
    
    
    