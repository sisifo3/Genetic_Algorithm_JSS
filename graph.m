function[] =   graph_g()

Positions=[1,2,3,4];
Gap_Duration=[0,2,5,3,5,3;
              3,5,3,5,3,4;
              9,3,0,0,12,2;
              13,2,2,2,8,3];
barh(Positions,Gap_Duration,'stacked');

set(H([1 3 5]),'Visible','off')

end