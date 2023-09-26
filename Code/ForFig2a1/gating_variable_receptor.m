function [S_out, xNMDA] = gating_variable_receptor(type_of_receptor, S_receptor, S_receptor1, Spike_neuron_gv, Spike_time_gv, current_time, time_step)
% [Pop_AMPA, ~] = gating_variable_receptor('AMPA', Pop_AMPA, [],...
%                          Poprandvec, Popspike_time, current_time, H); 

xNMDA = [];
S_out = [];
switch type_of_receptor
    case 'Fac'
        dfac = 0.15;%0.02;%0.1;%0.05;%0.1;%0.05;
        tao_Fac = 1000;%1000;%1500;%500;%ms
        S_out = S_receptor + ( - S_receptor)./tao_Fac.*time_step;
        Amp = [];
        Amp = find(Spike_neuron_gv == 1);
        S_out(Amp) = S_out(Amp) + dfac.*(1 - S_receptor(Amp));
        
    case 'AMPA'
        tao_AMPA = 2;%ms
        S_out = S_receptor.*exp(-time_step/tao_AMPA);
        Amp = [];
        Amp = find(Spike_neuron_gv == 1);
        S_out(Amp) = S_out(Amp) + exp(-(current_time - Spike_time_gv(Amp))./tao_AMPA);
        
    case 'NMDA'
        tao_xNMDA_rise = 2;%ms
        tao_NMDA_decay = 100;%ms
        alfa = 0.5;%ms-1
        
        xNMDA = S_receptor1.*exp(-time_step/tao_xNMDA_rise);
        Amp = [];
        Amp = find(Spike_neuron_gv == 1);
        xNMDA(Amp) = xNMDA(Amp) + exp(-(current_time - Spike_time_gv(Amp))./tao_xNMDA_rise);
        
        m1 = (- S_receptor./tao_NMDA_decay + alfa.*xNMDA.*(1 - S_receptor)).*time_step;
        m2 = (- (S_receptor + m1./2)./tao_NMDA_decay + alfa.*xNMDA.*(1 - (S_receptor + m1./2))).*time_step;
        S_out = S_receptor + m2;
        
    case 'GABA'
        tao_GABA = 5;%ms
        S_out = S_receptor.*exp(-time_step/tao_GABA);
        Amp = [];
        Amp = find(Spike_neuron_gv == 1);
        S_out(Amp) = S_out(Amp) + exp(-(current_time - Spike_time_gv(Amp))./tao_GABA);
        
    case 'GABAb'
        tao_GABA = 75;%ms
        S_out = S_receptor.*exp(-time_step/tao_GABA);
        Amp = [];
        Amp = find(Spike_neuron_gv == 1);
        S_out(Amp) = S_out(Amp) + exp(-(current_time - Spike_time_gv(Amp))./tao_GABA);
        
end
        
        