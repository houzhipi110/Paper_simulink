xa = 0:0.2:2;
ya = xa;
[x,y] = meshgrid(xa,ya);
z = 1-x-y;
z>0;
mesh(x,y,z,[0,2]);