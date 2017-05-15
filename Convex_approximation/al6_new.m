m=2;          k_=[4;3];     w_=[1,2;-2,1]; w=[1,2;-2,1]; u=[0,0];i=[nan,nan];
k0=k_
k0=[4;3];
U0=[1:m];
%for s=1:1:m
    js_=U0(1);
  %  j_=arg
  qz(1)=fix( k0(1,1)/abs(w_(1,js_)));
  qz(2)=fix(k0(2,1)/abs(w_(2,js_)));
    [y,j_]=min(qz);
    if  k0(j_,1)/w_(j_,js_)<0
        l(js_)=fix( k0(j_,1)/w_(j_,js_))
        qzz(1)=fix( k0(1,1)/w_(1,js_));
        qzz(2)=fix( k0(2,1)/w_(2,js_));
        %minµÄÅĞ¶ÏÎ´Ìí¼Ó
        for i=1:1:2
            if qzz(i)<0 
                qzz(i)=1000;
            end
        end
        [u(js_),z]=min(qzz)
    else
        u(js_)=fix( k0(j_,1)/w_(j_,js_))
         qzy(1)=-fix( k0(1,1)/w_(1,js_));
        qzy(2)=-fix( k0(2,1)/w_(2,js_));
        for i=1:1:2
            if -qzy(i)>=0 
                qzy(i)=1000;
            end
        end
        [l(js_),z]=min(qzy)
        l(js_)=-l(js_)
    end 
for i=1:1:2
    if k0(i,1)/w_(i,js_)<0
        k1(i,1)=k0(i,1)-l(1)*w(i,js_)
    else
         k1(i,1)=k0(i,1)-u(1)*w(i,js_)
    end 
end
        c=find(U0==js_);
        U0(c)=[];
        U1=U0



js_=2;

    qz(1)=fix( k1(1,1)/abs(w_(1,js_)));
    qz(2)=fix(k1(2,1)/abs(w_(2,js_)));
    [y,j_]=min(qz);
  %  j_=2;
    if  k1(j_,1)/w_(j_,js_)<0
        l(js_)=fix( k1(j_,1)/w_(j_,js_))
        qzz(1)=fix( k1(1,1)/w_(1,js_));
        qzz(2)=fix( k1(2,1)/w_(2,js_));
                for i=1:1:2
            if qzz(i)<0 
                qzz(i)=1000;
            end
        end
           [u(js_),z]=min(qzz)
     else   
            u(js_)=fix( k1(j_,1)/w_(j_,js_))
         qzy(1)=-fix( k1(1,1)/w_(1,js_));
        qzy(2)=-fix( k1(2,1)/w_(2,js_)) ;   
                for i=1:1:2
            if -qzy(i)>=0 
                qzy(i)=1000;
            end
        end
         [l(js_),z]=min(qzy)
         l(js_)=-l(js_)
    end
    for i=1:1:2
        if l(i)==1000|l(i)==-1000
            l(i)=nan;
        end
        if u(i)==1000|u(i)==-1000
             u(i)=nan;
        end
    end