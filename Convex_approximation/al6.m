m=2;          k_=[4;3];     w_=[1,2;-2,1]; w=[1,2;-2,1];
k0=k_
k0=[4;3];
U0=[1:m];
%for s=1:1:m
    js_=U0(1,1);
  %  j_=arg
  qz(1)=fix( k0(1,1)/abs(w_(1,js_)));
  qz(2)=fix(k0(2,1)/abs(w_(2,js_)));
    [y,j_]=min(qz);
    if  k0(j_,1)/w_(j_,js_)<0
        l(1)=fix( k0(j_,1)/w_(j_,js_))
        qzz(1)=fix( k0(1,1)/w_(1,js_));
        qzz(2)=fix( k0(2,1)/w_(2,js_));
        %minµÄÅÐ¶ÏÎ´Ìí¼Ó
        for i=1:1:2
            if qzz(i)<0 
                qzz(i)=1000;
            end
        end
        [u(1),z]=min(qzz)
    else
        u(1)=fix( k0(j_,1)/w_(j_,js_))
         qzy(1)=-fix( k0(1,1)/w_(1,js_));
        qzy(2)=-fix( k0(2,1)/w_(2,js_));
        for i=1:1:2
            if -qzy(i)>=0 
                qzy(i)=1000;
            end
        end
        [l(1),z]=min(qzy)
        l(1)=-l(1)
    end 
for i=1:1:2
    if k0(i,1)/w_(i,1)<0
        k1(i,1)=k0(i,1)-l(1)*w(i,js_)
    else
         k1(i,1)=k0(i,1)-u(1)*w(i,js_)
    end 
        c=find(U0==1);
        U0(c)=[];
        U1=U0
end

    qz(1)=fix( k1(1,1)/abs(w_(1,2)));
    qz(2)=fix(k1(2,1)/abs(w_(2,2)));
    [y,j_]=min(qz);
    if  k1(j_,1)/w_(j_,2)<0
        l(2)=fix( k1(j_,1)/w_(j_,2))
        qzz(1)=fix( k1(1,1)/w_(1,2));
        qzz(2)=fix( k1(2,1)/w_(2,2));
                for i=1:1:2
            if qzz(i)<0 
                qzz(i)=1000;
            end
        end
           [u(2),z]=min(qzz)
     else   
            u(2)=fix( k1(j_,1)/w_(j_,2))
         qzy(1)=-fix( k1(1,1)/w_(1,2));
        qzy(2)=-fix( k1(2,1)/w_(2,2)) ;   
                for i=1:1:2
            if -qzy(i)>=0 
                qzy(i)=1000;
            end
        end
         [l(2),z]=min(qzy)
         l(2)=-l(2)
    end
    for i=1:1:2
        if l(i)==1000|l(i)==-1000
            l(i)=nan;
        end
        if u(i)==1000|u(i)==-1000
             u(i)=nan;
        end
    end