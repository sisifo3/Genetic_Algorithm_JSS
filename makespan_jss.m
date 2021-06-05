function[] = makespan_jss()

mach = csvread('mach.csv');
dist = csvread('time_jss.csv');

ten20 = zeros(19,4);


m1 = zeros(2,6);
%m2 = zeros(2,6);
m3 = zeros(2,6);
%m4 = zeros(2,6);
m5 = zeros(2,6);
m6 = zeros(2,6);
m7 = zeros(2,6);
%m8 = zeros(2,6);
m9 = zeros(2,6);
m10 = zeros(2,6);
m11 = zeros(2,6);
m12 = zeros(2,6);
m13 = zeros(2,6);
m14 = zeros(2,6);


chrom = [3,4,5,1,2,6,7,8,7,3,2,1,6,7,2,3,3,2,2];
M = zeros(1,19);
time = zeros(1,8);

a = chrom(:,[1 2 3 4 5 6 7 8]);
b = chrom(:,[9 10 11 12 13]);
c  = chrom(:,[14 15 16]);
d = chrom(:,[17 18]);
d = chrom(19);

%disp(a)

for i= 1:8
    M(i) = mach(a(i),1);
    time(i) = dist(M(i),a(i));
    ten20(i,1) = a(i);
    ten20(i,2) = M(i);
    ten20(i,3) = time(i); 
end

for j= 1:5
    M(j+8) = mach(b(j),2);
    time(j+8) = dist(M(j+8),b(j));
    ten20(j+8,1) = b(j);
    ten20(j+8,2) = M(j+8);
    ten20(j+8,3) = time(j+8); 
end

for j= 1:3
    M(j+13) = mach(c(j),3);
    time(j+13) = dist(M(j+13),c(j));
    ten20(j+13,1) = c(j);
    ten20(j+13,2) = M(j+13);
    ten20(j+13,3) = time(j+13); 
end



%disp(M)
%disp(a)
%disp(time)
ma = 1;
%mb = 1;
mc = 1;
%md = 1;
me = 1;
mf = 1;
mg = 1;
%mh = 1;
mi = 1;
mj = 1;
mk = 1;
ml = 1;
mm = 1;
mn = 1;
mp = 1;


for j = 1:16

    if M(j) == 1
        m1(1,ma) = time(j);
        m1(2,ma) = chrom(j);
        
        if ma > 1
            temp = sum(m1(1,:));
            ten20(j,4) = temp;
        else
            ten20(j,4) = sum(m1(1,:));
        end
    
        ma = ma +1;
        
    elseif M(j) == 3 
        m3(1,mc) = time(j);
        m3(2,mc) = chrom(j);
        
        if mc > 1
            temp = sum(m3(1,:));
            ten20(j,4) = temp;
        else
            ten20(j,4) = sum(m3(1,:));
        end
        
        mc = mc+1;
    %elseif M(j) == 4
    %    m4(1,md) = time(j);
    %    m4(2,md) = a(j);
    %    md = md + 1;
    elseif M(j) == 5
        m5(1,me) = time(j);
        m5(2,me) = chrom(j);
        
         if me > 1
            temp = sum(m5(1,:));
            ten20(j,4) = temp;
        else
            ten20(j,4) = sum(m5(1,:));
        end
        me = me + 1;
    elseif M(j) == 6
        m6(1,mf) = time(j);
        m6(2,mf) = chrom(j);
        if mf > 1
            temp = sum(m6(1,:));
            ten20(j,4) = temp;
         else
            ten20(j,4) = sum(m6(1,:));    
            
        end
        mf = mf + 1;
    elseif M(j) == 7
        m7(1,mg) = time(j);
        m7(2,mg) = chrom(j);
        if mg >1
            temp = sum(m7(1,:));
            ten20(j,4) = temp;
         else
            ten20(j,4) = sum(m7(1,:));      
        end
        mg = mg + 1;
    %elseif M(j) == 8
    %    m8(1,mh) = time(j);
    %    m8(2,mh) = a(j);
    %    mh = mh +1;
    elseif M(j) == 9
        m9(1,mi) = time(j);
        m9(2,mj) = chrom(j);
        if mj > 1
            temp = sum(m9(1,:));
            ten20(j,4) = temp;
        else
            ten20(j,4) = sum(m9(1,:));      
        end
        
        mj = mj+1;
    elseif M(j) == 10 
        m10(1,mk) = time(j);
        m10(2,mk) = chrom(j);
        
        if mk > 1
            temp = sum(m10(1,:));
            ten20(j,4) = temp;
        else
            ten20(j,4) = sum(m10(1,:));      
        end
           
        mk = mk + 1;
    elseif M(j) == 11
        m11(1,ml) = time(j);
        m11(2,ml) = chrom(j);
        
        if ml > 1
            temp = sum(m11(1,:));
            ten20(j,4) = temp;
        else
            ten20(j,4) = sum(m11(1,:));      
        end
        
        
        ml = ml + 1;
    elseif M(j) == 12
        m12(1,mm) = time(j);
        m12(2,mm) = chrom(j);
       
        if mm > 1
            temp = sum(m12(1,:));
            ten20(j,4) = temp;
        else
            ten20(j,4) = sum(m12(1,:));      
        end
                
        mm = mm +1;
    elseif M(j) == 13
        m13(1,mn) = time(j);
        m13(2,mn) = chrom(j);
        
        if mn > 1
            temp = sum(m13(1,:));
            ten20(j,4) = temp;
        else
            ten20(j,4) = sum(m13(1,:));      
        end
        
        mn = mn + 1;
    else 
        m14(1,mp) = time(j);
        m14(2,mp) = chrom(j);
        if mp > 1
            temp = sum(m14(1,:));
            ten20(j,4) = temp;
        else
            ten20(j,4) = sum(m14(1,:));      
        end
        
        mp = mp + 1;
    end
end    
%disp(ten20)
% aparir de ste momento es necesario calcular la segunda cadena de tareas  

for ii = 1:5
    for jj = 1:8
        if b(ii) == a(jj)
            total_time_a = ten20(jj,4);
            total_time_b = ten20(ii+8,4);
            tt = total_time_b - total_time_a;
            %disp(ii)
            %disp(tt)
            if tt < 0
                t = ten20(ii+8,3); 
                ten20(ii+8,4) = total_time_a + t;
            elseif tt ==0
                ten20(ii+8,4) = ten20(jj,4) + ten20(ii+8,3);
            end
          %if b(ii) == 2
          %    m5
              
        end    
    end
end    


%b = 73216
%
disp(m5)
%disp(ten20) 



for ll = 1:3
    for kk = 1:5
        if c(ll) == b(kk)
            tta = ten20(kk+8,4);
            ttb = ten20(kk+13,4);
            tt = ttb - tta;
            if tt<0
                ten20(ll+13,4) = tta + ten20(kk+13,3);
            elseif tt ==0
                ten20(ll+13,4) = ten20(kk+8,4) + ten20(ll+13,3);
            end              
                
        end    
        if c(ll) ==2
            for ia = 1:2
                if m5(2,ia) == 2
                    m5(1,ia) = ten20(ll+13,4);
                end
            end
        end
        
    end
end
%disp(m5)
%disp(ten20) 


%{

disp(m1)
disp(m2)
disp(m3)
disp(m4)
disp(m5)
disp(m6)
disp(m7)
disp(m8)
disp(m9)
disp(m10)
disp(m11)
disp(m12)
disp(m13)
disp(m14)
disp(ten20)



%}

%b = 73216
%

%disp(M)
%[a,time] = ord_chrom(a,time);

%m1 = time(1);
%m7 = time(2);




%disp(M)
%disp(a)
%disp(time)





end