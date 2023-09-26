function fout = LIF(V1, Isyn1, type_of_neuron)

[m, n] = size(V1);
% Spike = zeros(m, n);
fout = zeros(m, n);
Vl = -70;%(mV)
Vth = -50;%(mV)
Vreset = -55;%(mV)
switch type_of_neuron 
    case 'pyr'
        Cm = 500;%(nF)
        Gl = 25;%(mS)
        tao_ref = 2;%(ms)
    case 'inh'
        Cm = 200;%(nF)
        Gl = 20;%(mS)
        tao_ref = 2;%(ms)
end

fout = -Gl/Cm.*(V1 - Vl) - Isyn1/Cm;


   
   




