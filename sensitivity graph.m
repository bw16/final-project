control=load('Control Sensitivity.mat');
positive=load('Positive Activity(MT Damage).mat');
cellname=load('Cell Name.mat');
control_sensitivity = str2double(control.ControlSensitivity);
positive_sensitivity = str2double(positive.PositiveSensitivity);
Sensitivity=cat(2,control_sensitivity,positive_sensitivity);
c=categorical(cellname.CellName);
bar(c,Sensitivity);
legend('positive sensitivity','negative sensitivity');
