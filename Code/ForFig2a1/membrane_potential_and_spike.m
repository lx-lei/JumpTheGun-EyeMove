function [Vout_mp, Spike_out, Spike_time, ref_time_out_mp] ...
    = membrane_potential_and_spike(Vmp, Isyn_mp, type_neuron_mp, ref_time_mp, t_step_mp, current_time)

% [Pyr_Pop.Vm, Pyr_Pop.Spike_neuron, Pyr_Pop.Spike_time, Pyr_Pop.ref_time] = ...
%                         membrane_potential_and_spike(Pyr_Pop.Vm, Pyr_Pop.Isyn, 'pyr', Pyr_Pop.ref_time, H, t);
                    
[m_mp, n_mp] =  size(Vmp);
%Vout_mp = zeros(m_mp, n_mp);
Spike_out = zeros(m_mp, n_mp);
Spike_time = zeros(m_mp, n_mp);
%ref_time_out_mp = zeros(m_mp, n_mp);

Vth = -50;%(mV)
Vreset = -55;%(mV)
switch type_neuron_mp 
    case 'inh'
       tao_ref = 2;%(ms)
    case 'pyr'
       tao_ref = 2;   
end

ref_time_out_mp = ref_time_mp + t_step_mp;

Vmp_pre = Vmp;

m1 =  LIF(Vmp, Isyn_mp, type_neuron_mp).*t_step_mp;
m2 =  LIF(Vmp + m1./2, Isyn_mp, type_neuron_mp).*t_step_mp;
Vmp = Vmp + m2;

Vmp(ref_time_out_mp < tao_ref) = Vreset;

Amp = find(Vmp >= Vth);

Spike_out(Amp) = 1;

Spike_time(Amp) = current_time - t_step_mp + (Vth - Vmp_pre(Amp))./(Vmp(Amp) - Vmp_pre(Amp)).*t_step_mp;

ref_time_out_mp(Amp) = current_time - Spike_time(Amp);

Vmp(Amp) = Vreset;
Vout_mp = Vmp;
            


