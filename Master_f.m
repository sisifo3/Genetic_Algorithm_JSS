function [master_cell] = Master_f()

n = 80;
master_cell = zeros(n,19); 
Fit = zeros(n,1);
IT = zeros(n,40);
F_G = zeros(n,40);
conn = zeros(1,n);
%master_cell = num2cell(master_cell);

for i = 1:n
    %hold off
    [solution,fitness,it,f_g,conv] = yellow_sub();
    IT(i,:) = it;
    F_G(i,:) = f_g;
    master_cell(i,:)= solution(1,:);
    Fit(i,1) = fitness;
    conn(1,i) = conv;
    %graph_g(solution)
    %figure(i)
    disp(i)   
end

%{
figure(1)
hist(conn)



figure(1)


figure(1)
figure(2)
figure(3)
figure(4)
figure(5)
figure(6)
figure(7)
figure(8)
figure(9)
figure(10)
figure(11)
figure(12)
figure(13)
figure(14)
figure(15)
figure(16)
figure(17)
figure(18)
figure(19)
figure(20)
figure(21)
figure(22)
figure(23)
figure(24)
figure(25)
figure(26)
figure(27)
figure(28)
figure(29)
figure(30)

figure(31)
figure(32)
figure(33)
figure(34)
figure(35)
figure(36)
figure(37)
figure(38)
figure(39)
figure(40)
figure(41)
figure(42)
figure(43)
figure(44)
figure(45)
figure(46)
figure(47)
figure(48)
figure(49)
figure(50)





figure(2)
Legend = zeros(n,1);
Legend=num2cell(Legend);
for j = 1:n
    plot(IT(j,:),F_G(j,:))
    Legend{j}=strcat('Number ', num2str(j));
    hold on
end
xlabel('Generations')
ylabel('Makespace')
legend(Legend)


figure(2)
%}

end