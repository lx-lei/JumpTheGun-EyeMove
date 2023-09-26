function [Sefe_Pop, Sefi_Pop, Sefii_Pop,Lipe_Pop,Lipi_Pop,Cd1_Pop,Cd2_Pop,Sni_Pop,Sce_Pop,Sci_Pop] = Total_synaptic_input(Sefe_Pop, ...
              Sefi_Pop, Sefii_Pop,Lipe_Pop,Lipi_Pop,Cd1_Pop,Cd2_Pop,Sni_Pop,Sce_Pop,Sci_Pop,Model_strc, Synaptic_p)
                 

Pop_Sefe_Vm = Sefe_Pop.Vm; 
Pop_Sefi_Vm = Sefi_Pop.Vm; 
Pop_Sefii_Vm = Sefii_Pop.Vm;
Pop_Lipe_Vm = Lipe_Pop.Vm;
Pop_Lipi_Vm = Lipi_Pop.Vm;
Pop_Cd1_Vm = Cd1_Pop.Vm;
Pop_Cd2_Vm = Cd2_Pop.Vm;
Pop_Sni_Vm = Sni_Pop.Vm;
Pop_Sce_Vm = Sce_Pop.Vm;
Pop_Sci_Vm = Sci_Pop.Vm;

Pop_Sefe_AMPA = Sefe_Pop.record.AMPA(Sefe_Pop.latency_step,:);
Pop_Sefe_NMDA = Sefe_Pop.record.NMDA(Sefe_Pop.latency_step,:);
Pop_Sefi_GABA = Sefi_Pop.record.GABA(Sefi_Pop.latency_step,:);
Pop_Sefii_GABA = Sefii_Pop.record.GABA(Sefii_Pop.latency_step,:);
Pop_Sefe_Fac = Sefe_Pop.record.Fac(Sefe_Pop.latency_step,:);
Pop_Lipe_AMPA = Lipe_Pop.record.AMPA(Lipe_Pop.latency_step,:);
Pop_Lipe_NMDA = Lipe_Pop.record.NMDA(Lipe_Pop.latency_step,:);
Pop_Lipi_GABA = Lipi_Pop.record.GABA(Lipi_Pop.latency_step,:);
Pop_Cd1_GABA = Cd1_Pop.record.GABA(Cd1_Pop.latency_step,:);
Pop_Cd2_GABA = Cd2_Pop.record.GABA(Cd2_Pop.latency_step,:);
Pop_Sni_GABA = Sni_Pop.record.GABA(Sni_Pop.latency_step,:);
Pop_Sci_GABA = Sci_Pop.record.GABA(Sci_Pop.latency_step,:);
Pop_Sce_NMDA = Sce_Pop.record.NMDA(Sce_Pop.latency_step,:);
Sum_Sefe_AMPA = sum(Pop_Sefe_AMPA);%/length(Pop_pyr_AMPA); % normalized by number of neurons
Sum_Sefe_NMDA = sum(Pop_Sefe_NMDA);%/length(Pop_pyr_NMDA);
Sum_Sefi_GABA = sum(Pop_Sefi_GABA);%/length(Pop_inh_GABA);
Sum_Sefii_GABA = sum(Pop_Sefii_GABA);
Sum_Lipe_AMPA = sum(Pop_Lipe_AMPA);
Sum_Lipe_NMDA = sum(Pop_Lipe_NMDA);
Sum_Lipi_GABA = sum(Pop_Lipi_GABA);
Sum_Cd1_GABA = sum(Pop_Cd1_GABA);
Sum_Cd2_GABA = sum(Pop_Cd2_GABA);
Sum_Sni_GABA = sum(Pop_Sni_GABA);
Sum_Sce_NMDA = sum(Pop_Sce_NMDA);
Pop_Sce_Fac = Sce_Pop.record.Fac(Sce_Pop.latency_step,:);
Sum_Sci_GABA = sum(Pop_Sci_GABA);

Sefe_Pop.I_Sefe2Sefe_rec_AMPA = Synatic_current('Sefe2Sefe_rec_AMPA', Pop_Sefe_Vm, Model_strc.J_EE*Sum_Sefe_AMPA, Synaptic_p);
Sefe_Pop.I_Sefe2Sefe_rec_NMDA = Synatic_current('Sefe2Sefe_rec_NMDA', Pop_Sefe_Vm, Model_strc.J_EE*Sum_Sefe_NMDA, Synaptic_p);
Sefe_Pop.I_Sefi2Sefe_GABA = Synatic_current('Sefi2Sefe_GABA', Pop_Sefe_Vm, Model_strc.J_EE*Sum_Sefi_GABA, Synaptic_p);
Sefe_Pop.I_Sefii2Sefe_GABA = Synatic_current('Sefii2Sefe_GABA', Pop_Sefe_Vm, Model_strc.J_EE*Sum_Sefii_GABA, Synaptic_p);
Sefe_Pop.I_Lipe2Sefe_AMPA = Synatic_current('Lipe2Sefe_AMPA', Pop_Sefe_Vm, Model_strc.J_EE*Sum_Lipe_AMPA, Synaptic_p);
Sefe_Pop.I_Lipe2Sefe_NMDA = Synatic_current('Lipe2Sefe_NMDA', Pop_Sefe_Vm, Model_strc.J_EE*Sum_Lipe_NMDA, Synaptic_p);
Sefe_Pop.I_Sce2Sefe_NMDA = Synatic_current('Sce2Sefe_NMDA', Pop_Sefe_Vm, Model_strc.J_EE*Sum_Sce_NMDA, Synaptic_p);

Sefi_Pop.I_Sefi2Sefi_GABA = Synatic_current('Sefi2Sefi_GABA', Pop_Sefi_Vm, Model_strc.J_EE*Sum_Sefi_GABA, Synaptic_p);
Sefi_Pop.I_Sefe2Sefi_AMPA = Synatic_current('Sefe2Sefi_AMPA', Pop_Sefi_Vm, Model_strc.J_EE*Sum_Sefe_AMPA, Synaptic_p);
Sefi_Pop.I_Sefe2Sefi_NMDA = Synatic_current('Sefe2Sefi_NMDA', Pop_Sefi_Vm, Model_strc.J_EE*Sum_Sefe_NMDA, Synaptic_p);
Sefi_Pop.I_Lipe2Sefi_AMPA = Synatic_current('Lipe2Sefi_AMPA', Pop_Sefi_Vm, Model_strc.J_EE*Sum_Lipe_AMPA, Synaptic_p);
Sefi_Pop.I_Lipe2Sefi_NMDA = Synatic_current('Lipe2Sefi_NMDA', Pop_Sefi_Vm, Model_strc.J_EE*Sum_Lipe_NMDA, Synaptic_p);
Sefi_Pop.I_Sce2Sefi_NMDA = Synatic_current('Sce2Sefi_NMDA', Pop_Sefi_Vm, Model_strc.J_EE*Sum_Sce_NMDA, Synaptic_p);

Sefii_Pop.I_Sefii2Sefii_GABA = Synatic_current('Sefii2Sefii_GABA', Pop_Sefii_Vm, Model_strc.J_EE*Sum_Sefii_GABA, Synaptic_p);
Sefii_Pop.I_Sefe2Sefii_AMPA = Synatic_current('Sefe2Sefii_AMPA', Pop_Sefii_Vm, Model_strc.J_EE*Sum_Sefe_AMPA, Synaptic_p);
Sum_Sefe_NMDA1 = sum(Pop_Sefe_NMDA.*Pop_Sefe_Fac); % facilitation
Sefii_Pop.I_Sefe2Sefii_NMDA = Synatic_current('Sefe2Sefii_NMDA', Pop_Sefii_Vm, Model_strc.J_EE*Sum_Sefe_NMDA, Synaptic_p);
Sefii_Pop.I_Lipe2Sefii_AMPA = Synatic_current('Lipe2Sefii_AMPA', Pop_Sefii_Vm, Model_strc.J_EE*Sum_Lipe_AMPA, Synaptic_p);%我加的Lipe2Sefii

Lipe_Pop.I_Lipe2Lipe_rec_AMPA = Synatic_current('Lipe2Lipe_rec_AMPA', Pop_Lipe_Vm, Model_strc.J_EE*Sum_Lipe_AMPA, Synaptic_p);
Lipe_Pop.I_Lipe2Lipe_rec_NMDA = Synatic_current('Lipe2Lipe_rec_NMDA', Pop_Lipe_Vm, Model_strc.J_EE*Sum_Lipe_NMDA, Synaptic_p);
Lipe_Pop.I_Lipi2Lipe_GABA = Synatic_current('Lipi2Lipe_GABA', Pop_Lipe_Vm, Model_strc.J_IE*Sum_Lipi_GABA, Synaptic_p);
Lipe_Pop.I_Sce2Lipe_NMDA = Synatic_current('Sce2Lipe_NMDA', Pop_Lipe_Vm, Model_strc.J_EE*Sum_Sce_NMDA, Synaptic_p);
Lipe_Pop.I_Sefe2Lipe_AMPA = Synatic_current('Sefe2Lipe_AMPA', Pop_Lipe_Vm, Model_strc.J_I1E*Sum_Sefe_AMPA, Synaptic_p);
Lipe_Pop.I_Sefe2Lipe_NMDA = Synatic_current('Sefe2Lipe_NMDA', Pop_Lipe_Vm, Model_strc.J_EE*Sum_Sefe_NMDA, Synaptic_p);

Lipi_Pop.I_Lipe2Lipi_AMPA = Synatic_current('Lipe2Lipi_AMPA', Pop_Lipi_Vm, Model_strc.J_EE*Sum_Lipe_AMPA, Synaptic_p);
Lipi_Pop.I_Lipe2Lipi_NMDA = Synatic_current('Lipe2Lipi_NMDA', Pop_Lipi_Vm, Model_strc.J_EE*Sum_Lipe_NMDA, Synaptic_p);
Lipi_Pop.I_Lipi2Lipi_GABA = Synatic_current('Lipi2Lipi_GABA', Pop_Lipi_Vm, Model_strc.J_IE*Sum_Lipi_GABA, Synaptic_p);
Lipi_Pop.I_Sce2Lipi_NMDA = Synatic_current('Sce2Lipi_NMDA', Pop_Lipi_Vm, Model_strc.J_EE*Sum_Sce_NMDA, Synaptic_p);
Lipi_Pop.I_Sefe2Lipi_AMPA = Synatic_current('Sefe2Lipi_AMPA', Pop_Lipi_Vm, Model_strc.J_I1E*Sum_Sefe_AMPA, Synaptic_p);
Lipi_Pop.I_Sefe2Lipi_NMDA = Synatic_current('Sefe2Lipi_NMDA', Pop_Lipi_Vm, Model_strc.J_EE*Sum_Sefe_NMDA, Synaptic_p);

Cd1_Pop.I_Sefe2Cd1_AMPA = Synatic_current('Sefe2Cd1_AMPA', Pop_Cd1_Vm, Model_strc.J_EE*Sum_Sefe_AMPA, Synaptic_p);
Cd2_Pop.I_Lipe2Cd2_AMPA = Synatic_current('Lipe2Cd2_AMPA', Pop_Cd2_Vm, Model_strc.J_EE*Sum_Lipe_AMPA, Synaptic_p);

Sni_Pop.I_Cd12Sni_GABA = Synatic_current('Cd12Sni_GABA', Pop_Sni_Vm, Model_strc.J_EE*Sum_Cd1_GABA, Synaptic_p);
Sni_Pop.I_Cd22Sni_GABA = Synatic_current('Cd22Sni_GABA', Pop_Sni_Vm, Model_strc.J_EE*Sum_Cd2_GABA, Synaptic_p);

Sce_Pop.I_Sci2Sce_GABA = Synatic_current('Sci2Sce_GABA', Pop_Sce_Vm, Model_strc.J_EE*Sum_Sci_GABA, Synaptic_p);
Sce_Pop.I_Sni2Sce_GABA = Synatic_current('Sni2Sce_GABA', Pop_Sce_Vm, Model_strc.J_EE*Sum_Sni_GABA, Synaptic_p);
Sce_Pop.I_Sce2Sce_rec_NMDA = Synatic_current('Sce2Sce_rec_NMDA', Pop_Sce_Vm, Model_strc.J_EE*Sum_Sce_NMDA, Synaptic_p);
Sce_Pop.I_Sefe2Sce_AMPA = Synatic_current('Sefe2Sce_AMPA', Pop_Sce_Vm, Model_strc.J_EE*Sum_Sefe_AMPA, Synaptic_p);
Sce_Pop.I_Lipe2Sce_AMPA = Synatic_current('Lipe2Sce_AMPA', Pop_Sce_Vm, Model_strc.J_EE*Sum_Lipe_AMPA, Synaptic_p);

Sci_Pop.I_Sci2Sci_GABA = Synatic_current('Sci2Sci_GABA', Pop_Sci_Vm, Model_strc.J_IE*Sum_Sci_GABA, Synaptic_p);
Sum_Sce_NMDA1 = sum(Pop_Sce_NMDA.*Pop_Sce_Fac);
Sci_Pop.I_Sce2Sci_NMDA = Synatic_current('Sce2Sci_NMDA', Pop_Sci_Vm, Model_strc.J_EE*Sum_Sce_NMDA1, Synaptic_p);


