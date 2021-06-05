function[desc1,desc2] = crossover_PMx_JSS(pred1,pred2)

%pred1 = [3,4,5,1,2,6,7,8,7,3,2,1,6,7,2,3,3,2,2];
%pred2 = [8,7,1,2,6,3,5,4,6,2,1,3,7,3,7,2,2,3,2];

desc1 = zeros(1,19);
desc2 = zeros(1,19);

a1 = zeros(1,8);
a2 = zeros(1,8);
b1 = zeros(1,5);
b2 = zeros(1,5);
c1 = zeros(1,3);
c2 = zeros(1,3);
d1 = zeros(1,2);
d2 = zeros(1,2);


a1(1,:) = pred1(1,[1:8]);
a2(1,:) = pred2(1,[1:8]);

b1(1,:) = pred1(1,[9:13]);
b2(1,:) = pred2(1,[9:13]);

c1(1,:) = pred1(1,[14:16]);
c2(1,:) = pred2(1,[14:16]);

d1(1,:) = pred1(1,[17:18]);
d2(1,:) = pred2(1,[17:18]);

[a1,a2] = crossover_PMx_a(a1,a2);
[b1,b2] = crossover_PMx_b(b1,b2);
[c1,c2] = crossover_PMx_c(c1,c2);
[d1,d2] = crossover_PMx_d(d1,d2);

desc1(1,[1:8]) = a1(1,:);
desc2(1,[1:8]) = a2(1,:);
desc1(1,[9:13]) = b1(1,:);
desc2(1,[9:13]) = b2(1,:);
desc1(1,[14:16]) = c1(1,:);
desc2(1,[14:16]) = c2(1,:);
desc1(1,[17,18]) = d1(1,:);
desc2(1,[17,18]) = d2(1,:);
desc1(1,19) = 2;
desc2(1,19) = 2;


end