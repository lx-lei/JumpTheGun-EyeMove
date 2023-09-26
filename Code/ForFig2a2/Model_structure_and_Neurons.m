function [Model_str, Synaptic_p, Sefe_Pop, Sefi_Pop, Sefii_Pop,Lipe_Pop,Lipi_Pop,Cd1_Pop,Cd2_Pop,Sni_Pop,...
    Sce_Pop,Sci_Pop] = Model_structure_and_Neurons(H)

%% Model_str
Model_str.Num_of_Sefe = 1024;
Model_str.Num_of_Sefi = 256;
Model_str.Num_of_Sefii = 256;
Model_str.Num_of_Lipe = 960;
Model_str.Num_of_Lipi = 240;
Model_str.Num_of_Cd1 = 500;
Model_str.Num_of_Cd2 = 500;
Model_str.Num_of_Sni = 1000;
Model_str.Num_of_Sce = 960;
Model_str.Num_of_Sci = 240;
Model_str.time_window = 50;%ms
Model_str.darta_time = 1;%ms

Model_str.J_EE = 1;%1.1;(ok)%1.2;(two high)%1.05;(ok)%1; % affect stable firing rate
Model_str.J_EI = 1;
Model_str.J_IE = 1;
Model_str.J_II = 1;

Model_str.J_EI1 = 1;
Model_str.J_I1E = 1;
Model_str.J_I1I1 = 1;



%% synaptic conductance
Synaptic_p.g_Sefe_MT_AMPA = 4.5;
Synaptic_p.g_Sefe2Sefe_rec_AMPA = 0.03;
Synaptic_p.g_Sefe_ext_AMPA = 2.1;
Synaptic_p.g_Sefe2Sefe_rec_NMDA = 0.215;%0.215
Synaptic_p.g_Sefi2Sefe_GABA = 1.317;%1.3
Synaptic_p.g_Sefii2Sefe_GABA = 2;
Synaptic_p.g_Lipe2Sefe_AMPA = 0.00;%0.005
Synaptic_p.g_Lipe2Sefe_NMDA = 0.00;%0.0165
Synaptic_p.g_Sce2Sefe_NMDA = 0.0;%0.05
Synaptic_p.g_Sefi_ext_AMPA = 1.62;
Synaptic_p.g_Sefi2Sefi_GABA = 1;
Synaptic_p.g_Sefe2Sefi_AMPA = 0.045;
Synaptic_p.g_Sefe2Sefi_NMDA = 0.129; %0.13
Synaptic_p.g_Lipe2Sefi_AMPA = 0.00; %0.004
Synaptic_p.g_Lipe2Sefi_NMDA = 0.00; %0.013
Synaptic_p.g_Sce2Sefi_NMDA = 0.26; %0.21 0.11
Synaptic_p.g_Sefii_ext_AMPA = 0;
Synaptic_p.g_Sefii2Sefii_GABA = 0.25;%0.11 0.13
Synaptic_p.g_Sefe2Sefii_AMPA = 0;%0.1  SEFE--SEFII=0
Synaptic_p.g_Sefe2Sefii_NMDA = 0;
Synaptic_p.g_Lipe2Sefii_AMPA = 0.3;%0.135 0.15 %我添加了LipE2SefII
%------------------------post LIP------------------------------------------
Synaptic_p.g_Lipe_ext_AMPA = 2.1;
Synaptic_p.g_Lipe2Lipe_rec_AMPA = 0.03*0;%0.05
Synaptic_p.g_Lipe2Lipe_rec_NMDA = 0.20;%0.17 0.165
Synaptic_p.g_Lipi2Lipe_GABA = 1.22;%1.22
Synaptic_p.g_Sce2Lipe_NMDA = 0.00;%0.05
Synaptic_p.g_Sefe2Lipe_AMPA = 0.00;%0.005
Synaptic_p.g_Sefe2Lipe_NMDA = 0.00;%0.00165
Synaptic_p.g_Lipi_MT_AMPA = 6.2;%4.2
Synaptic_p.g_Lipi_ext_AMPA = 1.62;
Synaptic_p.g_Lipe2Lipi_AMPA = 0.04;
Synaptic_p.g_Lipe2Lipi_NMDA = 0.132;%0.132 0.13
Synaptic_p.g_Lipi2Lipi_GABA = 1;
Synaptic_p.g_Sce2Lipi_NMDA = 0.26;%0.11
Synaptic_p.g_Sefe2Lipi_AMPA = 0.00;%0.004
Synaptic_p.g_Sefe2Lipi_NMDA = 0.00;%0.013
%----------------------post CD---------------------------------------------
Synaptic_p.g_Cd1_ext_AMPA = 2.1;
Synaptic_p.g_Sefe2Cd1_AMPA = 0.07;%0.063
Synaptic_p.g_Cd2_ext_AMPA = 2.1;
Synaptic_p.g_Lipe2Cd2_AMPA = 0.14;%0.16 0.14
Synaptic_p.g_Sni_ext_AMPA = 2.1;
Synaptic_p.g_Cd12Sni_GABA = 0.2;
Synaptic_p.g_Cd22Sni_GABA = 0.2;
%-----------------------post SC--------------------------------------------
Synaptic_p.g_Sce_ext_AMPA = 2.1;
Synaptic_p.g_Sci2Sce_GABA = 2.5;%2.5
Synaptic_p.g_Sni2Sce_GABA = 2.5;
Synaptic_p.g_Sce2Sce_rec_NMDA = 1.5;%1.5
Synaptic_p.g_Sefe2Sce_AMPA = 0.5*1;%1
Synaptic_p.g_Lipe2Sce_AMPA = 1.0*1;%1
Synaptic_p.g_Sci_ext_AMPA = 1.62;
Synaptic_p.g_Sci2Sci_GABA = 1;
Synaptic_p.g_Sce2Sci_NMDA = 0.7;%0.7
Synaptic_p.g_Cd1_KS = 0.576*1;
Synaptic_p.g_Cd1_AR = 0.0257*1;
Synaptic_p.g_Cd2_KS = 0.576*1;
Synaptic_p.g_Cd2_AR = 0.0257*1;

Synaptic_p.Ve = 0; %(mV)
Synaptic_p.Vi = -70;
Synaptic_p.Mg = 1;%mM
Synaptic_p.Vk = -90;

%lantency window
latency_of_receptor_Pyr = 0.5;%ms
latency_of_receptor_Inh = 0.5;%ms
Sefe_Pop.latency_window = floor(latency_of_receptor_Pyr/H); % 0.5/0.02=25
Sefi_Pop.latency_window = floor(latency_of_receptor_Inh/H);
Sefii_Pop.latency_window = floor(latency_of_receptor_Inh/H);
Lipe_Pop.latency_window = floor(latency_of_receptor_Pyr/H);
Lipi_Pop.latency_window = floor(latency_of_receptor_Inh/H);
Cd1_Pop.latency_window = floor(latency_of_receptor_Inh/H);
Cd2_Pop.latency_window = floor(latency_of_receptor_Inh/H);
Sni_Pop.latency_window = floor(latency_of_receptor_Inh/H);
Sce_Pop.latency_window = floor(latency_of_receptor_Pyr/H);
Sci_Pop.latency_window = floor(latency_of_receptor_Inh/H);

%Sefe
Sefe_Pop.Vm = -70+rand(1,Model_str.Num_of_Sefe).*10;%(-55);%mv
Sefe_Pop.Fac = zeros(1, Model_str.Num_of_Sefe); % facilitation
Sefe_Pop.AMPA = zeros(1, Model_str.Num_of_Sefe);%(0.1);
Sefe_Pop.MT_AMPA = zeros(1, Model_str.Num_of_Sefe);%(0.1);
Sefe_Pop.NMDA = zeros(1, Model_str.Num_of_Sefe);%(0.1);
Sefe_Pop.xNMDA = zeros(1, Model_str.Num_of_Sefe);%(0.1);
Sefe_Pop.extAMPA = zeros(1, Model_str.Num_of_Sefe);%(0.1);

Sefe_Pop.Isyn = zeros(1, Model_str.Num_of_Sefe);
Sefe_Pop.I_Sefe2Sefe_rec_AMPA = zeros(1, Model_str.Num_of_Sefe);
Sefe_Pop.Iext_AMPA = zeros(1, Model_str.Num_of_Sefe);
Sefe_Pop.I_MT_AMPA = zeros(1, Model_str.Num_of_Sefe);

Sefe_Pop.I_Sefe2Sefe_rec_NMDA = zeros(1, Model_str.Num_of_Sefe);
Sefe_Pop.I_Sefi2Sefe_GABA = zeros(1, Model_str.Num_of_Sefe);
Sefe_Pop.I_Sefii2Sefe_GABA = zeros(1, Model_str.Num_of_Sefe);
Sefe_Pop.I_Lipe2Sefe_AMPA = zeros(1, Model_str.Num_of_Sefe);
Sefe_Pop.I_Lipe2Sefe_NMDA = zeros(1, Model_str.Num_of_Sefe);
Sefe_Pop.I_Sce2Sefe_NMDA = zeros(1, Model_str.Num_of_Sefe);

Sefe_Pop.Spike_neuron = [];
Sefe_Pop.Spike_time = [];
Sefe_Pop.ref_time = rand(1, Model_str.Num_of_Sefe).*2;

Sefe_Pop.record.Spike = [];
Sefe_Pop.record.Fac = zeros(Sefe_Pop.latency_window, Model_str.Num_of_Sefe); % facilitation
Sefe_Pop.record.AMPA = zeros(Sefe_Pop.latency_window, Model_str.Num_of_Sefe);%(0.1);
Sefe_Pop.record.NMDA = zeros(Sefe_Pop.latency_window, Model_str.Num_of_Sefe);%(0.1);
Sefe_Pop.record.xNMDA = zeros(Sefe_Pop.latency_window, Model_str.Num_of_Sefe);%(0.1);
Sefe_Pop.record.extAMPA = zeros(Sefe_Pop.latency_window, Model_str.Num_of_Sefe);%(0.1); %9
Sefe_Pop.record.MT_AMPA = zeros(Sefe_Pop.latency_window, Model_str.Num_of_Sefe);
%Sefi
Sefi_Pop.Vm = -70+rand(1,Model_str.Num_of_Sefi).*10;%(-55);
Sefi_Pop.GABA = zeros(1, Model_str.Num_of_Sefi);%(0.1);
Sefi_Pop.extAMPA = zeros(1, Model_str.Num_of_Sefi);%(0.1);

Sefi_Pop.Isyn = zeros(1, Model_str.Num_of_Sefi);
Sefi_Pop.Iext_AMPA = zeros(1, Model_str.Num_of_Sefi);
Sefi_Pop.I_Sefi2Sefi_GABA = zeros(1, Model_str.Num_of_Sefi);
Sefi_Pop.I_Sefe2Sefi_AMPA = zeros(1, Model_str.Num_of_Sefi);
Sefi_Pop.I_Sefe2Sefi_NMDA = zeros(1, Model_str.Num_of_Sefi);
Sefi_Pop.I_Lipe2Sefi_AMPA = zeros(1, Model_str.Num_of_Sefi);
Sefi_Pop.I_Lipe2Sefi_NMDA = zeros(1, Model_str.Num_of_Sefi);
Sefi_Pop.I_Sce2Sefi_NMDA = zeros(1, Model_str.Num_of_Sefi);

Sefi_Pop.Spike_neuron = [];
Sefi_Pop.Spike_time = [];
Sefi_Pop.ref_time = rand(1, Model_str.Num_of_Sefi).*1;%(2);

Sefi_Pop.record.Spike = [];
Sefi_Pop.record.GABA = zeros(Sefi_Pop.latency_window, Model_str.Num_of_Sefi);%(0.1);
Sefi_Pop.record.extAMPA = zeros(Sefi_Pop.latency_window, Model_str.Num_of_Sefi);%(0.1); %9
%Sefii
Sefii_Pop.Vm = -70+rand(1,Model_str.Num_of_Sefii).*10;%(-55);
Sefii_Pop.GABA = zeros(1, Model_str.Num_of_Sefii);%(0.1);
Sefii_Pop.extAMPA = zeros(1, Model_str.Num_of_Sefii);%(0.1);

Sefii_Pop.Isyn = zeros(1, Model_str.Num_of_Sefii);
Sefii_Pop.Iext_AMPA = zeros(1, Model_str.Num_of_Sefii);
Sefii_Pop.I_Sefii2Sefii_GABA = zeros(1, Model_str.Num_of_Sefii);
Sefii_Pop.I_Sefe2Sefii_AMPA = zeros(1, Model_str.Num_of_Sefii);
Sefii_Pop.I_Sefe2Sefii_NMDA = zeros(1, Model_str.Num_of_Sefii);
Sefii_Pop.I_Lipe2Sefii_AMPA = zeros(1, Model_str.Num_of_Sefii);

Sefii_Pop.Spike_neuron = [];
Sefii_Pop.Spike_time = [];
Sefii_Pop.ref_time = rand(1, Model_str.Num_of_Sefii).*1;%(2);

Sefii_Pop.record.Spike = [];
Sefii_Pop.record.GABA = zeros(Sefii_Pop.latency_window, Model_str.Num_of_Sefii);%(0.1);
Sefii_Pop.record.extAMPA = zeros(Sefii_Pop.latency_window, Model_str.Num_of_Sefii);%(0.1); %9
%Lipe
Lipe_Pop.Vm = -70+rand(1,Model_str.Num_of_Lipe).*10;%(-55);%mv
Lipe_Pop.AMPA = zeros(1, Model_str.Num_of_Lipe);%(0.1);
Lipe_Pop.NMDA = zeros(1, Model_str.Num_of_Lipe);%(0.1);
Lipe_Pop.xNMDA = zeros(1, Model_str.Num_of_Lipe);%(0.1);
Lipe_Pop.extAMPA = zeros(1, Model_str.Num_of_Lipe);%(0.1);

Lipe_Pop.Isyn = zeros(1, Model_str.Num_of_Lipe);
Lipe_Pop.Iext_AMPA = zeros(1, Model_str.Num_of_Lipe);
Lipe_Pop.I_Lipe2Lipe_rec_AMPA = zeros(1, Model_str.Num_of_Lipe);
Lipe_Pop.I_Lipe2Lipe_rec_NMDA = zeros(1, Model_str.Num_of_Lipe);
Lipe_Pop.I_Lipi2Lipe_GABA = zeros(1, Model_str.Num_of_Lipe);
Lipe_Pop.I_Sce2Lipe_NMDA = zeros(1, Model_str.Num_of_Lipe);
Lipe_Pop.I_Sefe2Lipe_AMPA = zeros(1, Model_str.Num_of_Lipe);
Lipe_Pop.I_Sefe2Lipe_NMDA = zeros(1, Model_str.Num_of_Lipe);

Lipe_Pop.Spike_neuron = [];
Lipe_Pop.Spike_time = [];
Lipe_Pop.ref_time = rand(1, Model_str.Num_of_Lipe).*2;

Lipe_Pop.record.Spike = [];
Lipe_Pop.record.AMPA = zeros(Lipe_Pop.latency_window, Model_str.Num_of_Lipe);%(0.1);
Lipe_Pop.record.NMDA = zeros(Lipe_Pop.latency_window, Model_str.Num_of_Lipe);%(0.1);
Lipe_Pop.record.xNMDA = zeros(Lipe_Pop.latency_window, Model_str.Num_of_Lipe);%(0.1);
Lipe_Pop.record.extAMPA = zeros(Lipe_Pop.latency_window, Model_str.Num_of_Lipe);%(0.1); %9
%Lipi
Lipi_Pop.Vm = -70+rand(1,Model_str.Num_of_Lipi).*10;%(-55);
Lipi_Pop.GABA = zeros(1, Model_str.Num_of_Lipi);%(0.1);
Lipi_Pop.extAMPA = zeros(1, Model_str.Num_of_Lipi);%(0.1);
Lipi_Pop.MT_AMPA = zeros(1, Model_str.Num_of_Lipi);

Lipi_Pop.Isyn = zeros(1, Model_str.Num_of_Lipi);
Lipi_Pop.Iext_AMPA = zeros(1, Model_str.Num_of_Lipi);
Lipi_Pop.I_MT_AMPA = zeros(1, Model_str.Num_of_Lipi);
Lipi_Pop.I_Lipe2Lipi_AMPA = zeros(1, Model_str.Num_of_Lipi);
Lipi_Pop.I_Lipe2Lipi_NMDA = zeros(1, Model_str.Num_of_Lipi);
Lipi_Pop.I_Lipi2Lipi_GABA = zeros(1, Model_str.Num_of_Lipi);
Lipi_Pop.I_Sce2Lipi_NMDA = zeros(1, Model_str.Num_of_Lipi);
Lipi_Pop.I_Sefe2Lipi_AMPA = zeros(1, Model_str.Num_of_Lipi);
Lipi_Pop.I_Sefe2Lipi_NMDA = zeros(1, Model_str.Num_of_Lipi);

Lipi_Pop.Spike_neuron = [];
Lipi_Pop.Spike_time = [];
Lipi_Pop.ref_time = rand(1, Model_str.Num_of_Lipi).*1;%(2);

Lipi_Pop.record.Spike = [];
Lipi_Pop.record.GABA = zeros(Lipi_Pop.latency_window, Model_str.Num_of_Lipi);%(0.1);
Lipi_Pop.record.extAMPA = zeros(Lipi_Pop.latency_window, Model_str.Num_of_Lipi);%(0.1); %9
Lipi_Pop.record.MT_AMPA = zeros(Lipi_Pop.latency_window, Model_str.Num_of_Lipi);%(0.1); %9
%Cd1
Cd1_Pop.Vm = -70+rand(1,Model_str.Num_of_Cd1).*10;%(-55);
Cd1_Pop.GABA = zeros(1, Model_str.Num_of_Cd1);%(0.1);
Cd1_Pop.extAMPA = zeros(1, Model_str.Num_of_Cd1);%(0.1);
Cd1_Pop.M = zeros(1, Model_str.Num_of_Cd1);

Cd1_Pop.Isyn = zeros(1, Model_str.Num_of_Cd1);
Cd1_Pop.Iext_AMPA = zeros(1, Model_str.Num_of_Cd1);
Cd1_Pop.I_Sefe2Cd1_AMPA = zeros(1, Model_str.Num_of_Cd1);
Cd1_Pop.I_KS = zeros(1, Model_str.Num_of_Cd1);
Cd1_Pop.I_AR = zeros(1, Model_str.Num_of_Cd1);

Cd1_Pop.Spike_neuron = [];
Cd1_Pop.Spike_time = [];
Cd1_Pop.ref_time = rand(1, Model_str.Num_of_Cd1).*1;%(2);

Cd1_Pop.record.Spike = [];
Cd1_Pop.record.GABA = zeros(Cd1_Pop.latency_window, Model_str.Num_of_Cd1);%(0.1);
Cd1_Pop.record.extAMPA = zeros(Cd1_Pop.latency_window, Model_str.Num_of_Cd1);%(0.1); %9
%Cd2
Cd2_Pop.Vm = -70+rand(1,Model_str.Num_of_Cd2).*10;%(-55);
Cd2_Pop.GABA = zeros(1, Model_str.Num_of_Cd2);%(0.1);
Cd2_Pop.extAMPA = zeros(1, Model_str.Num_of_Cd2);%(0.1);
Cd2_Pop.M = ones(1, Model_str.Num_of_Cd2);

Cd2_Pop.Isyn = zeros(1, Model_str.Num_of_Cd2);
Cd2_Pop.Iext_AMPA = zeros(1, Model_str.Num_of_Cd2);
Cd2_Pop.I_Lipe2Cd2_AMPA = zeros(1, Model_str.Num_of_Cd2);
Cd2_Pop.I_KS = zeros(1, Model_str.Num_of_Cd2);
Cd2_Pop.I_AR = zeros(1, Model_str.Num_of_Cd2);

Cd2_Pop.Spike_neuron = [];
Cd2_Pop.Spike_time = [];
Cd2_Pop.ref_time = rand(1, Model_str.Num_of_Cd2).*1;%(2);

Cd2_Pop.record.Spike = [];
Cd2_Pop.record.GABA = zeros(Cd2_Pop.latency_window, Model_str.Num_of_Cd2);%(0.1);
Cd2_Pop.record.extAMPA = zeros(Cd2_Pop.latency_window, Model_str.Num_of_Cd2);%(0.1); %9
%Sni
Sni_Pop.Vm = -70+rand(1,Model_str.Num_of_Sni).*10;%(-55);
Sni_Pop.GABA = zeros(1, Model_str.Num_of_Sni);%(0.1);
Sni_Pop.extAMPA = zeros(1, Model_str.Num_of_Sni);%(0.1);

Sni_Pop.Isyn = zeros(1, Model_str.Num_of_Sni);
Sni_Pop.Iext_AMPA = zeros(1, Model_str.Num_of_Sni);
Sni_Pop.I_Cd12Sni_GABA = zeros(1, Model_str.Num_of_Sni);
Sni_Pop.I_Cd22Sni_GABA = zeros(1, Model_str.Num_of_Sni);

Sni_Pop.Spike_neuron = [];
Sni_Pop.Spike_time = [];
Sni_Pop.ref_time = rand(1, Model_str.Num_of_Sni).*1;%(2);

Sni_Pop.record.Spike = [];
Sni_Pop.record.GABA = zeros(Sni_Pop.latency_window, Model_str.Num_of_Sni);%(0.1);
Sni_Pop.record.extAMPA = zeros(Sni_Pop.latency_window, Model_str.Num_of_Sni);%(0.1); %9
%Sce
Sce_Pop.Vm = -70+rand(1,Model_str.Num_of_Sce).*10;%(-55);%mv
Sce_Pop.Fac = zeros(1, Model_str.Num_of_Sce); % facilitation
Sce_Pop.AMPA = zeros(1, Model_str.Num_of_Sce);%(0.1);
Sce_Pop.NMDA = zeros(1, Model_str.Num_of_Sce);%(0.1);
Sce_Pop.xNMDA = zeros(1, Model_str.Num_of_Sce);%(0.1);
Sce_Pop.extAMPA = zeros(1, Model_str.Num_of_Sce);%(0.1);

Sce_Pop.Isyn = zeros(1, Model_str.Num_of_Sce);
Sce_Pop.Iext_AMPA = zeros(1, Model_str.Num_of_Sce);
Sce_Pop.I_Sci2Sce_GABA = zeros(1, Model_str.Num_of_Sce);
Sce_Pop.I_Sni2Sce_GABA = zeros(1, Model_str.Num_of_Sce);
Sce_Pop.I_Sce2Sce_rec_NMDA = zeros(1, Model_str.Num_of_Sce);
Sce_Pop.I_Sefe2Sce_AMPA = zeros(1, Model_str.Num_of_Sce);
Sce_Pop.I_Lipe2Sce_AMPA = zeros(1, Model_str.Num_of_Sce);

Sce_Pop.Spike_neuron = [];
Sce_Pop.Spike_time = [];
Sce_Pop.ref_time = rand(1, Model_str.Num_of_Sce).*2;

Sce_Pop.record.Spike = [];
Sce_Pop.record.Fac = zeros(Sce_Pop.latency_window, Model_str.Num_of_Sce); % facilitation
Sce_Pop.record.AMPA = zeros(Sce_Pop.latency_window, Model_str.Num_of_Sce);%(0.1);
Sce_Pop.record.NMDA = zeros(Sce_Pop.latency_window, Model_str.Num_of_Sce);%(0.1);
Sce_Pop.record.xNMDA = zeros(Sce_Pop.latency_window, Model_str.Num_of_Sce);%(0.1);
Sce_Pop.record.extAMPA = zeros(Sce_Pop.latency_window, Model_str.Num_of_Sce);%(0.1); %9
%Sci
Sci_Pop.Vm = -70+rand(1,Model_str.Num_of_Sci).*10;%(-55);
Sci_Pop.GABA = zeros(1, Model_str.Num_of_Sci);%(0.1);
Sci_Pop.extAMPA = zeros(1, Model_str.Num_of_Sci);%(0.1);

Sci_Pop.Isyn = zeros(1, Model_str.Num_of_Sci);
Sci_Pop.Iext_AMPA = zeros(1, Model_str.Num_of_Sci);
Sci_Pop.I_Sci2Sci_GABA = zeros(1, Model_str.Num_of_Sci);
Sci_Pop.I_Sce2Sci_NMDA = zeros(1, Model_str.Num_of_Sci);

Sci_Pop.Spike_neuron = [];
Sci_Pop.Spike_time = [];
Sci_Pop.ref_time = rand(1, Model_str.Num_of_Sci).*1;%(2);

Sci_Pop.record.Spike = [];
Sci_Pop.record.GABA = zeros(Sci_Pop.latency_window, Model_str.Num_of_Sci);%(0.1);
Sci_Pop.record.extAMPA = zeros(Sci_Pop.latency_window, Model_str.Num_of_Sci);%(0.1); %9


