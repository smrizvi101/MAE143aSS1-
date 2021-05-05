% cos_73.m 
% from the Renaissance Robotics codebase, by Thomas Bewley

function [out]=cos_73(x)
c=floor(x/(2*pi)); if c==0, y=x; else, y=x-2*pi*c; end, q=floor(y/(pi/2));
switch q
  case 1, out=-cos_73_eval(pi-y);
  case 2, out=-cos_73_eval(y-pi);    
  case 3, out= cos_73_eval(2*pi-y);
  otherwise, out=cos_73_eval(y);
end
end
%%%%%%%%%%%%%%%%%
function [out]=cos_73_eval(z)
c1= 0.999999953464;  c2=-0.4999999053455; c3=0.0416635846769;
c4=-0.0013853704264; c5=0.00002315393167;
z2=z^2; out=c1+z2*(c2+z2*(c3+z2*(c4+c5*z2)));
end