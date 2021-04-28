% Balance_Resistors.m 
% from the Renaissance Robotics codebase, by Thomas Bewley

% This code determines the resistor dividers in Vmon1 circuit of Berets
% Basic equation for divider: (Vi-GND)/(Ri+R0)=(Vmon-GND)/R0
% Max value for Vmon voltage: 3.2V. Max value of Vin=28V.
% Max value of battery cell=4.4V.

R0=10000; GND=0; Vmon=3.2;
I_nom=(Vmon-GND)/R0; Nominal_Power_R0=I^2*R0
V=[12 28 4.4*6 4.4*5 4.4*4 4.4*3 4.4*2 4.4*1];
for i=1:8
    % Determine ideal upper resistor value in voltage divider
    R(i)=(V(i)-GND)*( R0/(Vmon-GND) - R0/(V(i)-GND) );
    % Round the Ri to standard 1% resistor value (E96)
    Ra(i)=CommonResistorValue(R(i),96,'closest');
    % Scale factors to determine the Vi from Vmon:
    scale(i)=(Ra(i)+R0)/R0;
    % Maximum values of Vmon from each Vi (should each be around 3.2)
    Vmon_max(i)=R0*(V(i)-GND)/(Ra(i)+R0)+GND;
end
Ra, scale, Vmon_max
% Maximum power (in watts) used by resistors in upper part of circuit.