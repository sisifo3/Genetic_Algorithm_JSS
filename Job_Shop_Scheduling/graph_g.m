function[] = graph_g()%chrom)


chrom = [3,2,6,3,3,2,2,2,1,7,8,6,2,3,7,7,4,1,5];
%chrom =  [2,7,3,2,2,6,2,1,7,3,6,2,3,5,8,1,3,4,7];
%chrom = [2,7,3,6,2,2,3,2,6,3,2,4,7,5,1,7,1,3,8];

mach = csvread('mach.csv');
dist = csvread('time_jss.csv');

machine = zeros(14,1);
tent = zeros (19,4);
index = zeros(8,5);
tent(:,1) = chrom(1,:);
mindex= zeros(14,8);
g = zeros(14,8);
gt = zeros(14,8);

v = [];
n = 1;

for i = 1:19
    
    for j = 1:length(v)
        c = any(v(1,j) == chrom(1,i));
        n = n + c;
    end
    
    index(chrom(1,i),n) = i;
    tent(i,2) = mach(chrom(1,i),n);
    tent(i,3) = dist(tent(i,2), tent(i,1));
    
    if n == 1
        indx = index(chrom(1,i),n);
        if machine(tent(i,2),1) >= tent(indx,4)
            tent(i,4) = machine(tent(i,2),1) + tent(i,3);
            machine(tent(i,2),1) = tent(i,4);
            
        else
            tent(i,4) = tent(indx,4) + tent(i,3);
            machine(tent(i,2),1) = tent(i,4);
        end    
        %g(tent(i,2),n) = tent(i,3);
    elseif n > 1
        indx = index(chrom(1,i),n-1);
        if machine(tent(i,2),1) >= tent(indx,4)
            tent(i,4) = machine(tent(i,2),1) + tent(i,3);
            %gt(tent(i,2),n) = tent(i,4) - machine(tent(i,2),1) - tent(i,3);
            machine(tent(i,2),1) = tent(i,4);
        else
            tent(i,4) = tent(indx,4) + tent(i,3);
            %machine(tent(i,2),1) = tent(i,4);
            %gt(tent(i,2),n) = tent(i,4) - machine(tent(i,2),1) - tent(i,3);
            machine(tent(i,2),1) = tent(i,4);
        end  
        %g(tent(i,2),n) = tent(i,3);

    end            
    v = [v,chrom(1,i)];
    n = 1;
end




vm = [];
m = 1;
%mt = zeros(14,1);
for ii = 1:19
    for jj = 1:length(vm)
        c = any(vm(1,jj) == tent(ii,2));
        m = m + c;
    end
    
    mindex(tent(ii,2),m) = ii;
    g(tent(ii,2),m) = tent(ii,3);
    if m == 1
        gt(tent(ii,2),m) = tent(ii,4) - tent(ii,3);
    elseif m > 1
        m1 = m-1;
        r = mindex(tent(ii,2),m1);
        vta = tent(r,4);
        %disp(r)
        gt(tent(ii,2),m) = tent(ii,4) - tent(ii,3) - vta;
    end    
    
    vm = [vm,tent(ii,2)];
    m = 1;
end  

g = zeros(14,1);
gt = zeros(14,1);
aa = 1;
for an = 1:19
    if tent(an,1) == 1
        %a_index = [a_index,an];
        g(tent(an,2),aa) = tent(an,3);
        gt(tent(an,2),aa) = tent(an,4) - tent(an,3);
        
    end
end

Positions=[1,2,3,4,5,6,7,8,9,10,11,12,13,14];

Gap_Duration=[gt(1,1),g(1,1);
               0,0;
               gt(3,1),g(3,1);
               0,0;
               gt(5,1),g(5,1);
               gt(6,1),g(6,1);
               gt(7,1),g(7,1);
               0,0;
               gt(9,1),g(9,1);
               gt(10,1),g(10,1);
               gt(11,1),g(11,1);
               gt(12,1),g(12,1);
               gt(13,1),g(13,1);
               gt(14,1),g(14,1)];

H1 = barh(Positions,Gap_Duration,'stacked');
set(H1(1),'Visible','off');

%legend(H1(2),{"Trabajo 1"})

hold on;

g = zeros(14,1);
gt = zeros(14,1);
aa = 1;
for an = 1:19
    if tent(an,1) == 2
        %a_index = [a_index,an];
        g(tent(an,2),aa) = tent(an,3);
        gt(tent(an,2),aa) = tent(an,4) - tent(an,3);
        
    end
end

Positions=[1,2,3,4,5,6,7,8,9,10,11,12,13,14];

Gap_Duration=[gt(1,1),g(1,1);
               0,0;
               gt(3,1),g(3,1);
               0,0;
               gt(5,1),g(5,1);
               gt(6,1),g(6,1);
               gt(7,1),g(7,1);
               0,0;
               gt(9,1),g(9,1);
               gt(10,1),g(10,1);
               gt(11,1),g(11,1);
               gt(12,1),g(12,1);
               gt(13,1),g(13,1);
               gt(14,1),g(14,1)];

H2 = barh(Positions,Gap_Duration,'stacked');
set(H2(1),'Visible','off');
%legend([H1(2),H2(2)],{'Trabajo 1','Trabajo 2'})




g = zeros(14,1);
gt = zeros(14,1);
aa = 1;
for an = 1:19
    if tent(an,1) == 3
        %a_index = [a_index,an];
        g(tent(an,2),aa) = tent(an,3);
        gt(tent(an,2),aa) = tent(an,4) - tent(an,3);
        
    end
    a = 1;
end

Positions=[1,2,3,4,5,6,7,8,9,10,11,12,13,14];

Gap_Duration=[gt(1,1),g(1,1);
               0,0;
               gt(3,1),g(3,1);
               0,0;
               gt(5,1),g(5,1);
               gt(6,1),g(6,1);
               gt(7,1),g(7,1);
               0,0;
               gt(9,1),g(9,1);
               gt(10,1),g(10,1);
               gt(11,1),g(11,1);
               gt(12,1),g(12,1);
               gt(13,1),g(13,1);
               gt(14,1),g(14,1)];

H3 = barh(Positions,Gap_Duration,'stacked');
set(H3(1),'Visible','off');
%legend([H1(2),H2(2),H3(2)],{'Trabajo 1','Trabajo 2','Trabajo 3'})





g = zeros(14,1);
gt = zeros(14,1);
aa = 1;
for an = 1:19
    if tent(an,1) == 4
        %a_index = [a_index,an];
        g(tent(an,2),aa) = tent(an,3);
        gt(tent(an,2),aa) = tent(an,4) - tent(an,3);
        
    end
    a = 1;
end

Positions=[1,2,3,4,5,6,7,8,9,10,11,12,13,14];

Gap_Duration=[gt(1,1),g(1,1);
               0,0;
               gt(3,1),g(3,1);
               0,0;
               gt(5,1),g(5,1);
               gt(6,1),g(6,1);
               gt(7,1),g(7,1);
               0,0;
               gt(9,1),g(9,1);
               gt(10,1),g(10,1);
               gt(11,1),g(11,1);
               gt(12,1),g(12,1);
               gt(13,1),g(13,1);
               gt(14,1),g(14,1)];

H4 = barh(Positions,Gap_Duration,'stacked');
set(H4(1),'Visible','off');

%legend([H1(2),H2(2),H3(2),H4(2)],{'Trabajo 1','Trabajo 2','trabajo 3','trabajo 4'})







g = zeros(14,1);
gt = zeros(14,1);
aa = 1;
for an = 1:19
    if tent(an,1) == 5
        %a_index = [a_index,an];
        g(tent(an,2),aa) = tent(an,3);
        gt(tent(an,2),aa) = tent(an,4) - tent(an,3);
        
    end
    a = 1;
end

Positions=[1,2,3,4,5,6,7,8,9,10,11,12,13,14];

Gap_Duration=[gt(1,1),g(1,1);
               0,0;
               gt(3,1),g(3,1);
               0,0;
               gt(5,1),g(5,1);
               gt(6,1),g(6,1);
               gt(7,1),g(7,1);
               0,0;
               gt(9,1),g(9,1);
               gt(10,1),g(10,1);
               gt(11,1),g(11,1);
               gt(12,1),g(12,1);
               gt(13,1),g(13,1);
               gt(14,1),g(14,1)];

H5 = barh(Positions,Gap_Duration,'stacked');
set(H5(1),'Visible','off');




g = zeros(14,1);
gt = zeros(14,1);
aa = 1;
for an = 1:19
    if tent(an,1) == 6
        %a_index = [a_index,an];
        g(tent(an,2),aa) = tent(an,3);
        gt(tent(an,2),aa) = tent(an,4) - tent(an,3);
        
    end
    a = 1;
end

Positions=[1,2,3,4,5,6,7,8,9,10,11,12,13,14];

Gap_Duration=[gt(1,1),g(1,1);
               0,0;
               gt(3,1),g(3,1);
               0,0;
               gt(5,1),g(5,1);
               gt(6,1),g(6,1);
               gt(7,1),g(7,1);
               0,0;
               gt(9,1),g(9,1);
               gt(10,1),g(10,1);
               gt(11,1),g(11,1);
               gt(12,1),g(12,1);
               gt(13,1),g(13,1);
               gt(14,1),g(14,1)];

H6 = barh(Positions,Gap_Duration,'stacked');
set(H6(1),'Visible','off');






g = zeros(14,1);
gt = zeros(14,1);
aa = 1;
for an = 1:19
    if tent(an,1) == 7
        %a_index = [a_index,an];
        g(tent(an,2),aa) = tent(an,3);
        gt(tent(an,2),aa) = tent(an,4) - tent(an,3);
        
    end
    a = 1;
end

Positions=[1,2,3,4,5,6,7,8,9,10,11,12,13,14];

Gap_Duration=[gt(1,1),g(1,1);
               0,0;
               gt(3,1),g(3,1);
               0,0;
               gt(5,1),g(5,1);
               gt(6,1),g(6,1);
               gt(7,1),g(7,1);
               0,0;
               gt(9,1),g(9,1);
               gt(10,1),g(10,1);
               gt(11,1),g(11,1);
               gt(12,1),g(12,1);
               gt(13,1),g(13,1);
               gt(14,1),g(14,1)];

H7 = barh(Positions,Gap_Duration,'stacked');
set(H7(1),'Visible','off');



g = zeros(14,1);
gt = zeros(14,1);
aa = 1;
for an = 1:19
    if tent(an,1) == 8
        %a_index = [a_index,an];
        g(tent(an,2),aa) = tent(an,3);
        gt(tent(an,2),aa) = tent(an,4) - tent(an,3);
        
    end
    a = 1;
end

Positions=[1,2,3,4,5,6,7,8,9,10,11,12,13,14];

Gap_Duration=[gt(1,1),g(1,1);
               0,0;
               gt(3,1),g(3,1);
               0,0;
               gt(5,1),g(5,1);
               gt(6,1),g(6,1);
               gt(7,1),g(7,1);
               0,0;
               gt(9,1),g(9,1);
               gt(10,1),g(10,1);
               gt(11,1),g(11,1);
               gt(12,1),g(12,1);
               gt(13,1),g(13,1);
               gt(14,1),g(14,1)];

H8 = barh(Positions,Gap_Duration,'stacked');
set(H8(1),'Visible','off');

ylabel('Máquina')
xlabel('Tiempo')

legend([H1(2) H2(2) H3(2) H4(2) H5(2) H6(2) H7(2) H8(2)],'trabajo 1','trabajo 2','trabajo 3','trabajo 4','trabajo 5','trabajo 6','trabajo 7', 'trabajo 8')

hold off;

end