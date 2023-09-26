% function [Firing_rate_record, Synaptic_p, Sefe_Pop, Sefi_Pop, Sefii_Pop,Lipe_Pop,Lipi_Pop,Cd1_Pop,Cd2_Pop,Sni_Pop,...
%    Sce_Pop,Sci_Pop] = NetworkDynamics(T_N)
 function [Firing_rate_record,t] = NetworkDynamics(T_N)


T = zeros(T_N,1); % 1500
H = 0.05;
cue = [250, 260]; %[1500, 2000];
fixation = [0, 600];%600
tstm = [1000,2000];
Firing_rate_record = [];
Sefe_freq = 2.2;
Sefi_freq = 2.4;
Sefii_freq = 0;
Lipe_freq = 2.4;
Lipi_freq = 2.4;
Cd1_freq = 1;
Cd2_freq = 1;
Sni_freq = 2.4;
Sce_freq = 2.4;
Sci_freq = 2.4;
coh=1;
s=0;
%% 
[Model_str, Synaptic_p, Sefe_Pop, Sefi_Pop, Sefii_Pop,Lipe_Pop,Lipi_Pop,Cd1_Pop,Cd2_Pop,Sni_Pop,...
    Sce_Pop,Sci_Pop]= Model_structure_and_Neurons(H);

%% 
for evolution_time = 1:T_N
          if mod(evolution_time,10000)==0
              disp(evolution_time);
          end
          T(evolution_time) = evolution_time*H;
          t = T(evolution_time);
          %if rem(t, 500) == 0
           %   t
          %end
          Sefe_MT_freq = 0;
          Lipi_MT_freq = 0;
          % synaptic latency
          Sefe_Pop.latency_step   =   rem(floor(t/H), Sefe_Pop.latency_window) + 1; 
          Sefi_Pop.latency_step   =   rem(floor(t/H), Sefi_Pop.latency_window) + 1;
          Sefii_Pop.latency_step   =   rem(floor(t/H), Sefii_Pop.latency_window) + 1;
          Lipe_Pop.latency_step   =   rem(floor(t/H), Lipe_Pop.latency_window) + 1;
          Lipi_Pop.latency_step   =   rem(floor(t/H), Lipi_Pop.latency_window) + 1;
          Cd1_Pop.latency_step   =   rem(floor(t/H), Cd1_Pop.latency_window) + 1;
          Cd2_Pop.latency_step   =   rem(floor(t/H), Cd2_Pop.latency_window) + 1;
          Sni_Pop.latency_step   =   rem(floor(t/H), Sni_Pop.latency_window) + 1;
          Sce_Pop.latency_step   =   rem(floor(t/H), Sce_Pop.latency_window) + 1;
          Sci_Pop.latency_step   =   rem(floor(t/H), Sci_Pop.latency_window) + 1;
          %external input
          Sefe_Pop = External_synaptic_input(Sefe_Pop,'EXT','Sefe_ext_AMPA',Sefe_Pop.latency_step, ...
              Model_str, t, H, Sefe_freq, coh, tstm, Synaptic_p);
          Sefi_Pop = External_synaptic_input(Sefi_Pop,'EXT','Sefi_ext_AMPA',Sefi_Pop.latency_step, ...
              Model_str, t, H, Sefi_freq, coh, tstm, Synaptic_p);
          Sefii_Pop = External_synaptic_input(Sefii_Pop,'EXT','Sefii_ext_AMPA', Sefii_Pop.latency_step,...
              Model_str, t, H, Sefii_freq, coh, tstm, Synaptic_p);
          Lipe_Pop = External_synaptic_input(Lipe_Pop,'EXT','Lipe_ext_AMPA',Lipe_Pop.latency_step, ...
              Model_str, t, H, Lipe_freq, coh, tstm, Synaptic_p);
          Lipi_Pop = External_synaptic_input(Lipi_Pop,'EXT','Lipi_ext_AMPA',Lipi_Pop.latency_step, ...
              Model_str, t, H, Lipi_freq, coh, tstm, Synaptic_p);
          Cd1_Pop = External_synaptic_input(Cd1_Pop,'EXT','Cd1_ext_AMPA',Cd1_Pop.latency_step, ...
              Model_str, t, H, Cd1_freq, coh, tstm, Synaptic_p);
          Cd2_Pop = External_synaptic_input(Cd2_Pop,'EXT','Cd2_ext_AMPA',Cd2_Pop.latency_step, ...
              Model_str, t, H, Cd2_freq, coh, tstm, Synaptic_p);
          Sni_Pop = External_synaptic_input(Sni_Pop,'EXT','Sni_ext_AMPA',Sni_Pop.latency_step, ...
              Model_str, t, H, Sni_freq, coh, tstm, Synaptic_p);
          Sci_Pop = External_synaptic_input(Sci_Pop,'EXT','Sci_ext_AMPA',Sci_Pop.latency_step, ...
              Model_str, t, H, Sci_freq, coh, tstm, Synaptic_p);
          Sce_Pop = External_synaptic_input(Sce_Pop,'EXT','Sce_ext_AMPA',Sce_Pop.latency_step, ...
              Model_str, t, H, Sce_freq, coh, tstm, Synaptic_p);
          if t >= cue(1) && t <= cue(2)
              Sefe_MT_freq = 0.45;
          end
          if t >= fixation(1) && t <= fixation(2)
              Lipi_MT_freq = 0.04;%0.04
          end  
          Sefe_Pop = External_synaptic_input(Sefe_Pop,'MT','Sefe_MT_AMPA',Sefe_Pop.latency_step, ...
                   Model_str, t, H, Sefe_MT_freq, coh, tstm, Synaptic_p);
          Lipi_Pop = External_synaptic_input(Lipi_Pop,'MT','Lipi_MT_AMPA',Lipi_Pop.latency_step, ...
                   Model_str, t, H, Lipi_MT_freq, coh, tstm, Synaptic_p); 
          [Cd1_Pop, Cd2_Pop] = KS_AR( Cd1_Pop, Cd2_Pop, Synaptic_p, H);
          % total synaptic input
          [Sefe_Pop, Sefi_Pop, Sefii_Pop,Lipe_Pop,Lipi_Pop,Cd1_Pop,Cd2_Pop,Sni_Pop,Sce_Pop,Sci_Pop] = Total_synaptic_input(Sefe_Pop, ...
              Sefi_Pop, Sefii_Pop,Lipe_Pop,Lipi_Pop,Cd1_Pop,Cd2_Pop,Sni_Pop,Sce_Pop,Sci_Pop,Model_str, Synaptic_p);
          Sefe_Pop.Isyn = Sefe_Pop.I_Sefe2Sefe_rec_AMPA + Sefe_Pop.Iext_AMPA + Sefe_Pop.I_Sefe2Sefe_rec_NMDA + Sefe_Pop.I_Sefi2Sefe_GABA...
             + Sefe_Pop.I_Sefii2Sefe_GABA + Sefe_Pop.I_Lipe2Sefe_AMPA + Sefe_Pop.I_Lipe2Sefe_NMDA + Sefe_Pop.I_Sce2Sefe_NMDA + Sefe_Pop.I_MT_AMPA;
          Sefi_Pop.Isyn = Sefi_Pop.Iext_AMPA + Sefi_Pop.I_Sefi2Sefi_GABA + Sefi_Pop.I_Sefe2Sefi_AMPA + Sefi_Pop.I_Sefe2Sefi_NMDA...
             + Sefi_Pop.I_Lipe2Sefi_AMPA + Sefi_Pop.I_Lipe2Sefi_NMDA + Sefi_Pop.I_Sce2Sefi_NMDA;
          Sefii_Pop.Isyn = Sefii_Pop.Iext_AMPA + Sefii_Pop.I_Sefii2Sefii_GABA + Sefii_Pop.I_Sefe2Sefii_AMPA + Sefii_Pop.I_Sefe2Sefii_NMDA...
             + Sefii_Pop.I_Lipe2Sefii_AMPA; %我加了Lipe2Sefii_AMPA电流
          Lipe_Pop.Isyn = Lipe_Pop.Iext_AMPA + Lipe_Pop.I_Lipe2Lipe_rec_AMPA + Lipe_Pop.I_Lipe2Lipe_rec_NMDA + Lipe_Pop.I_Lipi2Lipe_GABA... 
             + Lipe_Pop.I_Sce2Lipe_NMDA + Lipe_Pop.I_Sefe2Lipe_AMPA + Lipe_Pop.I_Sefe2Lipe_NMDA;
          Lipi_Pop.Isyn = Lipi_Pop.Iext_AMPA + Lipi_Pop.I_Lipe2Lipi_AMPA + Lipi_Pop.I_Lipe2Lipi_NMDA + Lipi_Pop.I_Lipi2Lipi_GABA...
             + Lipi_Pop.I_Sce2Lipi_NMDA + Lipi_Pop.I_Sefe2Lipi_AMPA + Lipi_Pop.I_Sefe2Lipi_NMDA + Lipi_Pop.I_MT_AMPA;
          Cd1_Pop.Isyn = Cd1_Pop.Iext_AMPA + Cd1_Pop.I_Sefe2Cd1_AMPA + Cd1_Pop.I_KS + Cd1_Pop.I_AR;
          Cd2_Pop.Isyn = Cd2_Pop.Iext_AMPA + Cd2_Pop.I_Lipe2Cd2_AMPA + Cd2_Pop.I_KS + Cd2_Pop.I_AR;
          Sni_Pop.Isyn = Sni_Pop.Iext_AMPA + Sni_Pop.I_Cd12Sni_GABA + Sni_Pop.I_Cd22Sni_GABA;
          Sce_Pop.Isyn = Sce_Pop.Iext_AMPA + Sce_Pop.I_Sci2Sce_GABA + Sce_Pop.I_Sni2Sce_GABA + Sce_Pop.I_Sce2Sce_rec_NMDA...
             + Sce_Pop.I_Sefe2Sce_AMPA + Sce_Pop.I_Lipe2Sce_AMPA;
          Sci_Pop.Isyn = Sci_Pop.Iext_AMPA + Sci_Pop.I_Sci2Sci_GABA + Sci_Pop.I_Sce2Sci_NMDA;
          
          
          % getting spiking data using LIF model
          [Sefe_Pop.Vm, Sefe_Pop.Spike_neuron, Sefe_Pop.Spike_time, Sefe_Pop.ref_time] = ...
                        membrane_potential_and_spike(Sefe_Pop.Vm, Sefe_Pop.Isyn, 'pyr', Sefe_Pop.ref_time, H, t);     
                    
          Spiking_neuron_sequence = find(Sefe_Pop.Spike_neuron == 1);
          Sefe_Pop.record.Spike = [Sefe_Pop.record.Spike; [Spiking_neuron_sequence',...
                                  Sefe_Pop.Spike_time(Spiking_neuron_sequence)']];
         
          % getting spiking data using LIF model            
          [Sefi_Pop.Vm, Sefi_Pop.Spike_neuron, Sefi_Pop.Spike_time, Sefi_Pop.ref_time] = ...
                        membrane_potential_and_spike(Sefi_Pop.Vm, Sefi_Pop.Isyn, 'inh', Sefi_Pop.ref_time, H, t);

          Spiking_neuron_sequence = find(Sefi_Pop.Spike_neuron == 1);
          Sefi_Pop.record.Spike = [Sefi_Pop.record.Spike; [Spiking_neuron_sequence',...
                                  Sefi_Pop.Spike_time(Spiking_neuron_sequence)']];
         
          % getting spiking data using LIF model            
          [Sefii_Pop.Vm, Sefii_Pop.Spike_neuron, Sefii_Pop.Spike_time, Sefii_Pop.ref_time] = ...
                        membrane_potential_and_spike(Sefii_Pop.Vm, Sefii_Pop.Isyn, 'inh', Sefii_Pop.ref_time, H, t);

          Spiking_neuron_sequence = find(Sefii_Pop.Spike_neuron == 1);
          Sefii_Pop.record.Spike = [Sefii_Pop.record.Spike; [Spiking_neuron_sequence',...
                                  Sefii_Pop.Spike_time(Spiking_neuron_sequence)']];         
          
          % getting spiking data using LIF model
          [Lipe_Pop.Vm, Lipe_Pop.Spike_neuron, Lipe_Pop.Spike_time, Lipe_Pop.ref_time] = ...
                        membrane_potential_and_spike(Lipe_Pop.Vm, Lipe_Pop.Isyn, 'pyr', Lipe_Pop.ref_time, H, t);     
                    
          Spiking_neuron_sequence = find(Lipe_Pop.Spike_neuron == 1);
          Lipe_Pop.record.Spike = [Lipe_Pop.record.Spike; [Spiking_neuron_sequence',...
                                  Lipe_Pop.Spike_time(Spiking_neuron_sequence)']];                    
         
          % getting spiking data using LIF model
          [Lipi_Pop.Vm, Lipi_Pop.Spike_neuron, Lipi_Pop.Spike_time, Lipi_Pop.ref_time] = ...
                        membrane_potential_and_spike(Lipi_Pop.Vm, Lipi_Pop.Isyn, 'inh', Lipi_Pop.ref_time, H, t);     
                    
          Spiking_neuron_sequence = find(Lipi_Pop.Spike_neuron == 1);
          Lipi_Pop.record.Spike = [Lipi_Pop.record.Spike; [Spiking_neuron_sequence',...
                                  Lipi_Pop.Spike_time(Spiking_neuron_sequence)']];
                              
          % getting spiking data using LIF model
          [Cd1_Pop.Vm, Cd1_Pop.Spike_neuron, Cd1_Pop.Spike_time, Cd1_Pop.ref_time] = ...
                        membrane_potential_and_spike(Cd1_Pop.Vm, Cd1_Pop.Isyn, 'pyr', Cd1_Pop.ref_time, H, t);     
                    
          Spiking_neuron_sequence = find(Cd1_Pop.Spike_neuron == 1);
          Cd1_Pop.record.Spike = [Cd1_Pop.record.Spike; [Spiking_neuron_sequence',...
                                  Cd1_Pop.Spike_time(Spiking_neuron_sequence)']];
                              
          % getting spiking data using LIF model
          [Cd2_Pop.Vm, Cd2_Pop.Spike_neuron, Cd2_Pop.Spike_time, Cd2_Pop.ref_time] = ...
                        membrane_potential_and_spike(Cd2_Pop.Vm, Cd2_Pop.Isyn, 'pyr', Cd2_Pop.ref_time, H, t);     
                    
          Spiking_neuron_sequence = find(Cd2_Pop.Spike_neuron == 1);
          Cd2_Pop.record.Spike = [Cd2_Pop.record.Spike; [Spiking_neuron_sequence',...
                                  Cd2_Pop.Spike_time(Spiking_neuron_sequence)']];
                           
          % getting spiking data using LIF model
          [Sni_Pop.Vm, Sni_Pop.Spike_neuron, Sni_Pop.Spike_time, Sni_Pop.ref_time] = ...
                        membrane_potential_and_spike(Sni_Pop.Vm, Sni_Pop.Isyn, 'pyr', Sni_Pop.ref_time, H, t);     
                    
          Spiking_neuron_sequence = find(Sni_Pop.Spike_neuron == 1);
          Sni_Pop.record.Spike = [Sni_Pop.record.Spike; [Spiking_neuron_sequence',...
                                  Sni_Pop.Spike_time(Spiking_neuron_sequence)']];
          
          % getting spiking data using LIF model
          [Sce_Pop.Vm, Sce_Pop.Spike_neuron, Sce_Pop.Spike_time, Sce_Pop.ref_time] = ...
                        membrane_potential_and_spike(Sce_Pop.Vm, Sce_Pop.Isyn, 'pyr', Sce_Pop.ref_time, H, t);     
                    
          Spiking_neuron_sequence = find(Sce_Pop.Spike_neuron == 1);
          Sce_Pop.record.Spike = [Sce_Pop.record.Spike; [Spiking_neuron_sequence',...
                                  Sce_Pop.Spike_time(Spiking_neuron_sequence)']];  
                              
          % getting spiking data using LIF model
          [Sci_Pop.Vm, Sci_Pop.Spike_neuron, Sci_Pop.Spike_time, Sci_Pop.ref_time] = ...
                        membrane_potential_and_spike(Sci_Pop.Vm, Sci_Pop.Isyn, 'inh', Sci_Pop.ref_time, H, t);     
                    
          Spiking_neuron_sequence = find(Sci_Pop.Spike_neuron == 1);
          Sci_Pop.record.Spike = [Sci_Pop.record.Spike; [Spiking_neuron_sequence',...
                                  Sci_Pop.Spike_time(Spiking_neuron_sequence)']];
                              
          %%%%%%%%%%%%%%%%%%%%%
          % update gating variables  
          [Sefe_Pop.Fac , ~] = gating_variable_receptor('Fac', Sefe_Pop.Fac, [],...
                                 Sefe_Pop.Spike_neuron, Sefe_Pop.Spike_time, t, H); 
          [Sefe_Pop.AMPA , ~] = gating_variable_receptor('AMPA', Sefe_Pop.AMPA, [],...
                                 Sefe_Pop.Spike_neuron, Sefe_Pop.Spike_time, t, H); 
          [Sefe_Pop.NMDA, Sefe_Pop.xNMDA] = gating_variable_receptor('NMDA', Sefe_Pop.NMDA, Sefe_Pop.xNMDA,...
                                 Sefe_Pop.Spike_neuron, Sefe_Pop.Spike_time, t, H); 
          [Sefi_Pop.GABA, ~] = gating_variable_receptor('GABA', Sefi_Pop.GABA, [],...
                                 Sefi_Pop.Spike_neuron, Sefi_Pop.Spike_time, t, H);
          [Sefii_Pop.GABA, ~] = gating_variable_receptor('GABAb', Sefii_Pop.GABA, [],...
                                 Sefii_Pop.Spike_neuron, Sefii_Pop.Spike_time, t, H);%这里章梦娅写的GABAb，改成GABA
          [Lipe_Pop.AMPA , ~] = gating_variable_receptor('AMPA', Lipe_Pop.AMPA, [],...
                                 Lipe_Pop.Spike_neuron, Lipe_Pop.Spike_time, t, H); 
          [Lipe_Pop.NMDA, Lipe_Pop.xNMDA] = gating_variable_receptor('NMDA', Lipe_Pop.NMDA, Lipe_Pop.xNMDA,...
                                 Lipe_Pop.Spike_neuron, Lipe_Pop.Spike_time, t, H);
          [Lipi_Pop.GABA, ~] = gating_variable_receptor('GABA', Lipi_Pop.GABA, [],...
                                 Lipi_Pop.Spike_neuron, Lipi_Pop.Spike_time, t, H);   
          [Cd1_Pop.GABA, ~] = gating_variable_receptor('GABA', Cd1_Pop.GABA, [],...
                                 Cd1_Pop.Spike_neuron, Cd1_Pop.Spike_time, t, H);    
          [Cd2_Pop.GABA, ~] = gating_variable_receptor('GABA', Cd2_Pop.GABA, [],...
                                 Cd2_Pop.Spike_neuron, Cd2_Pop.Spike_time, t, H);   
          [Sni_Pop.GABA, ~] = gating_variable_receptor('GABA', Sni_Pop.GABA, [],...
                                 Sni_Pop.Spike_neuron, Sni_Pop.Spike_time, t, H);  
          [Sci_Pop.GABA, ~] = gating_variable_receptor('GABA', Sci_Pop.GABA, [],...
                                 Sci_Pop.Spike_neuron, Sci_Pop.Spike_time, t, H);   
          [Sce_Pop.Fac , ~] = gating_variable_receptor('Fac', Sce_Pop.Fac, [],...
                                 Sce_Pop.Spike_neuron, Sce_Pop.Spike_time, t, H); 
          [Sce_Pop.NMDA, Sce_Pop.xNMDA] = gating_variable_receptor('NMDA', Sce_Pop.NMDA, Sce_Pop.xNMDA,...
                                 Sce_Pop.Spike_neuron, Sce_Pop.Spike_time, t, H); 
          % GABAb - s increases faster
                             
          % update stored gating variables
          Sefe_Pop.record.Fac(Sefe_Pop.latency_step,:)    =    Sefe_Pop.Fac;
          Sefe_Pop.record.AMPA(Sefe_Pop.latency_step,:)    =    Sefe_Pop.AMPA;
          Sefe_Pop.record.NMDA(Sefe_Pop.latency_step,:)    =    Sefe_Pop.NMDA;
          Sefe_Pop.record.xNMDA(Sefe_Pop.latency_step,:)   =    Sefe_Pop.xNMDA;
          Sefe_Pop.record.extAMPA(Sefe_Pop.latency_step,:) =    Sefe_Pop.extAMPA;
          Sefe_Pop.record.MT_AMPA(Sefe_Pop.latency_step,:) =    Sefe_Pop.MT_AMPA;
          Sefi_Pop.record.GABA(Sefi_Pop.latency_step,:)     =    Sefi_Pop.GABA;
          Sefi_Pop.record.extAMPA(Sefi_Pop.latency_step,:)  =    Sefi_Pop.extAMPA;
          Sefii_Pop.record.GABA(Sefii_Pop.latency_step,:)     =    Sefii_Pop.GABA;
          Sefii_Pop.record.extAMPA(Sefii_Pop.latency_step,:)  =    Sefii_Pop.extAMPA;
          Lipe_Pop.record.AMPA(Lipe_Pop.latency_step,:)    =    Lipe_Pop.AMPA;
          Lipe_Pop.record.NMDA(Lipe_Pop.latency_step,:)    =    Lipe_Pop.NMDA;
          Lipe_Pop.record.xNMDA(Lipe_Pop.latency_step,:)   =    Lipe_Pop.xNMDA;
          Lipe_Pop.record.extAMPA(Lipe_Pop.latency_step,:) =    Lipe_Pop.extAMPA;
          Lipi_Pop.record.GABA(Lipi_Pop.latency_step,:)     =    Lipi_Pop.GABA;
          Lipi_Pop.record.extAMPA(Lipi_Pop.latency_step,:)  =    Lipi_Pop.extAMPA;
          Lipi_Pop.record.MT_AMPA(Lipi_Pop.latency_step,:)  =    Lipi_Pop.MT_AMPA;
          Cd1_Pop.record.GABA(Cd1_Pop.latency_step,:)     =    Cd1_Pop.GABA;
          Cd1_Pop.record.extAMPA(Cd1_Pop.latency_step,:)  =    Cd1_Pop.extAMPA;
          Cd2_Pop.record.GABA(Cd2_Pop.latency_step,:)     =    Cd2_Pop.GABA;
          Cd2_Pop.record.extAMPA(Cd2_Pop.latency_step,:)  =    Cd2_Pop.extAMPA;
          Sni_Pop.record.GABA(Sni_Pop.latency_step,:)     =    Sni_Pop.GABA;
          Sni_Pop.record.extAMPA(Sni_Pop.latency_step,:)  =    Sni_Pop.extAMPA;
          Sci_Pop.record.GABA(Sci_Pop.latency_step,:)     =    Sci_Pop.GABA;
          Sci_Pop.record.extAMPA(Sci_Pop.latency_step,:)  =    Sci_Pop.extAMPA;
          Sce_Pop.record.Fac(Sce_Pop.latency_step,:)    =    Sce_Pop.Fac;
          Sce_Pop.record.NMDA(Sce_Pop.latency_step,:)    =    Sce_Pop.NMDA;
          Sce_Pop.record.xNMDA(Sce_Pop.latency_step,:)   =    Sce_Pop.xNMDA;
          Sce_Pop.record.extAMPA(Sce_Pop.latency_step,:) =    Sce_Pop.extAMPA;
          % transform spiking data to firing rate data
          if t >= Model_str.time_window  %Model_str.time_window=50ms
              if rem(t, Model_str.darta_time) == 0   %Model_str.darta_time=5ms
                  Firing_rate = Spiking_tranform_firing_rate(t, Model_str, Sefe_Pop.record.Spike, Sefi_Pop.record.Spike, Sefii_Pop.record.Spike, ...
                                Lipe_Pop.record.Spike, Lipi_Pop.record.Spike, Cd1_Pop.record.Spike, Cd2_Pop.record.Spike, Sni_Pop.record.Spike, ...
                                Sce_Pop.record.Spike, Sci_Pop.record.Spike);
                  Firing_rate_record = [Firing_rate_record; Firing_rate];
              end
          end
          
%           if t >= Model_str.time_window  %Model_str.time_window=50ms
%               if rem(t, Model_str.darta_time) == 0   
%                   Firing_rate = Spiking_tranform_firing_rate(t, Model_str, Sefe_Pop.record.Spike, Sefi_Pop.record.Spike, Sefii_Pop.record.Spike, ...
%                                 Lipe_Pop.record.Spike, Lipi_Pop.record.Spike, Cd1_Pop.record.Spike, Cd2_Pop.record.Spike, Sni_Pop.record.Spike, ...
%                                 Sce_Pop.record.Spike, Sci_Pop.record.Spike);
%                   Firing_rate_record = [Firing_rate_record; Firing_rate];          
%                   if Firing_rate(1, 10)>40&&Firing_rate(1, 10)<=s
%                       return
%                   end
%                   s=Firing_rate(1, 10);  
%               end
%           end
          
end




