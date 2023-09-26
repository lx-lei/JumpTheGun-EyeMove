function Pop = External_synaptic_input(Pop,type_of_stmls,type_of_synaps,latency_step,Model_str_es, current_time, H, Freq, coherence, tstm, Synaptic_p)

switch type_of_stmls
    case 'EXT'
        Pop_Vm = Pop.Vm; 
        Pop_AMPA_I = Pop.record.extAMPA(latency_step,:);
        Pop_AMPA = Pop.extAMPA;

        [m1, n1] = size(Pop_Vm);
        Poprandvec = rand(m1, n1) < H*Freq;%H*Pop_input_profile - poisson rate;
        Popspike_time = zeros(m1, n1);
        Popspike_time(Poprandvec == 1) = current_time;

        Iext_pop = Synatic_current(type_of_synaps, Pop_Vm, Pop_AMPA_I, Synaptic_p);
        [Pop_AMPA, ~] = gating_variable_receptor('AMPA', Pop_AMPA, [],...
                                 Poprandvec, Popspike_time, current_time, H); 

        Pop.extAMPA = Pop_AMPA;
        Pop.Iext_AMPA = Iext_pop;
        
    case 'MT'
        Pop_Vm = Pop.Vm; 
        Pop_AMPA_I = Pop.record.MT_AMPA(latency_step,:);
        Pop_AMPA = Pop.MT_AMPA;

        [m1, n1] = size(Pop_Vm);
        Poprandvec = rand(m1, n1) < H*Freq;%H*Pop_input_profile - poisson rate;
        Popspike_time = zeros(m1, n1);
        Popspike_time(Poprandvec == 1) = current_time;

        I_MT_pop = Synatic_current(type_of_synaps, Pop_Vm, Pop_AMPA_I, Synaptic_p);
        [Pop_MT_AMPA, ~] = gating_variable_receptor('AMPA', Pop_AMPA, [],...
                                 Poprandvec, Popspike_time, current_time, H); 

        Pop.MT_AMPA = Pop_MT_AMPA;
        Pop.I_MT_AMPA = I_MT_pop;
end       