function[fitness] = amkespan_jss_b(chrom)


%chrom = [3,4,5,1,2,6,7,8,7,3,2,1,6,7,2,3,3,2,2];

mach = csvread('mach.csv');
dist = csvread('time_jss.csv');

machine = zeros(14,1);
exist_var = [];
tent = zeros (19,4);
tent(:,1) = chrom;

tent([1:8],2) = mach(tent([1:8],1),1);
tent([9:13],2) = mach(tent([9:13],1),2);
tent([14:16],2) = mach(tent([14:16],1),3);
tent([17:18],2) = mach(tent([17:18],1),4);
tent(19,2) = mach(tent(19,1),5);
%disp(tent)

for i = 1:19
    tent(i,3) = dist(tent(i,2), tent(i,1));
end

tent([1:8],4) = tent([1:8],3);

% es necesario completar la cuarta fila
%disp(tent)
for ii = 1:8
    for jj = 1:8
        exist = any(exist_var(:) == tent(ii,2));
        if tent(ii,2) == tent(jj,2) && exist == 0 && ii ~= jj
            tent(jj,4) = tent(ii,3) + tent(jj,3);
            exist_var = [exist_var,tent(ii,2)];
        end
    end
end    

%disp(tent)
%tenemos el valor por máquinas, mas adelante
% es necesario.
for j = 1:8
    an = tent(j,2);
    machine(an,1) = machine(an,1) + tent(j,3);
    
end

%disp(machine)
%Necesitamos comparar y evaluar la segunda cadena de operaciones;

for k = 1:5
    for l = 1:8 
        if tent(k+8,1) == tent(l,1)
            index = l;
            if tent(index,4) > machine(tent(k+8,2),1)
                %es mayor la operacion pasada
                tent(k+8,4) = tent(index,4) + tent(k+8,3);
                machine(tent(k+8,2),1) = tent(k+8,4);
            elseif tent(index,4) < machine(tent(k+8,2),1)
                tent(k+8,4) = machine(tent(k+8,2),1) + tent(k+8,3);
                machine(tent(k+8,1),1) = tent(k+8,4);
            else
                tent(k+8,4) = machine(tent(k+8,2)) + tent(k+8,3);
                machine(tent(k+8,2)) = tent(k+8,4); 
            end  
        end
    end
end

%disp(tent)
%evaluacion de la tercera cadena

for p = 1:3
    for q = 1:5
        if tent(p+13,1) == tent(q+8,1)
            index = q + 8;
            if tent(index,4) > machine(tent(p+13,2),1)
                tent(p+13,4) = tent(index,4) + tent(p+13,3);
                machine(tent(p+13,2),1) = tent(p+13,4);
            elseif tent(index,4) < machine(tent(p+13,2),1)
                tent(p+13,4) = machine(tent(p+13,2),1) + tent(p+13,3);
                machine(tent(p+13,2),1) = tent(p+13,4);
            else
                tent(p+13,4) = machine(tent(p+13,2),1) + tent(p+13,3);
                machine(tent(p+13,2),1) = tent(p+13,4);
            end
        end
    end
end
%disp(tent)
%cuarta cadena

for v = 1:2
    for w = 1:3
        if tent(v+16,1) == tent(w+13,1)
            index = w+13;
            if tent(index,4) > machine(tent(v+16,2),1)
                tent(v+16,4) = tent(index,4) + tent(v+16,3);
                machine(tent(v+16,2),1) = tent(v+16,4);
            elseif tent(index,4) < machine(tent(v+16,2),1)
                tent(v+16,4) = machine(tent(v+16,2),1) + tent(v+16,3);
                machine(tent(v+16,2),1) = tent(v+16,4);
            else
                tent(v+16,4) = machine(tent(v+16,2),1) + tent(v+16,3);
                machine(tent(v+16,2),1) = tent(v+16,4);
            end
        end
    end
end

%disp(tent)        
%quinta y ultima.
for u = 1:2
    if tent(19,1)  == tent(u+16,1)
        index = u +16;
        if tent(index,4) > machine(tent(19,2),1)
            tent(19,4) = tent(index,4) + tent(19,3);
            machine(tent(19,2),1) = tent(19,4);
        elseif tent(index,4) < machine(tent(19,2),1)
            tent(19,4) = machine(tent(19,2),1) + tent(19,3);
            machine(tent(19,2),1) = tent(19,4);
        else 
            tent(19,4) = machine(tent(19,2),1) + tent(19,3);
            machine(tent(19,2),1) = tent(19,4);
        end
    end
end

%disp(tent)

fitness = sum(tent(:,4));
%disp(fitness)
end