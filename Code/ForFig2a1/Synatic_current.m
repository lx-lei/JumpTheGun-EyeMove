function I_out = Synatic_current(type_of_synaps, Vsc, Sum_S, Synaptic_p) %, varargin

[m, n] = size(Vsc);
I_out = zeros(m, n);
Ve = Synaptic_p.Ve; %(mV)
Vi = Synaptic_p.Vi;
Mg = Synaptic_p.Mg;%mM
switch type_of_synaps
    %Sefe 
    case 'Sefe_MT_AMPA'
        g_conductance = Synaptic_p.g_Sefe_MT_AMPA;
        I_out = g_conductance.*(Vsc - Ve).*Sum_S;
    case 'Sefe2Sefe_rec_AMPA'
        g_conductance = Synaptic_p.g_Sefe2Sefe_rec_AMPA;
        I_out = g_conductance.*(Vsc - Ve).*Sum_S;
    case 'Sefe_ext_AMPA'
        g_conductance = Synaptic_p.g_Sefe_ext_AMPA;
        I_out = g_conductance.*(Vsc - Ve).*Sum_S;
    case 'Sefe2Sefe_rec_NMDA' 
        g_conductance = Synaptic_p.g_Sefe2Sefe_rec_NMDA;
        I_out = g_conductance.*(Vsc - Ve)./(1 + Mg.*exp(-0.062.*Vsc)./3.57).*Sum_S;
    case 'Sefi2Sefe_GABA'
        g_conductance = Synaptic_p.g_Sefi2Sefe_GABA;
        I_out = g_conductance.*(Vsc - Vi).*Sum_S;
    case 'Sefii2Sefe_GABA'
        g_conductance = Synaptic_p.g_Sefii2Sefe_GABA;
        I_out = g_conductance.*(Vsc - Vi).*Sum_S;
    case 'Lipe2Sefe_AMPA'
        g_conductance = Synaptic_p.g_Lipe2Sefe_AMPA;
        I_out = g_conductance.*(Vsc - Ve).*Sum_S;
    case 'Lipe2Sefe_NMDA'
        g_conductance = Synaptic_p.g_Lipe2Sefe_NMDA;
        I_out = g_conductance.*(Vsc - Ve)./(1 + Mg.*exp(-0.062.*Vsc)./3.57).*Sum_S;    
    case 'Sce2Sefe_NMDA'
        g_conductance = Synaptic_p.g_Sce2Sefe_NMDA;
        I_out = g_conductance.*(Vsc - Ve)./(1 + Mg.*exp(-0.062.*Vsc)./3.57).*Sum_S;  
    %Sefi  
    case 'Sefi_ext_AMPA'
        g_conductance = Synaptic_p.g_Sefi_ext_AMPA;
        I_out = g_conductance.*(Vsc - Ve).*Sum_S;
    case 'Sefi2Sefi_GABA'
        g_conductance = Synaptic_p.g_Sefi2Sefi_GABA;
        I_out = g_conductance.*(Vsc - Vi).*Sum_S;    
    case 'Sefe2Sefi_AMPA'
        g_conductance = Synaptic_p.g_Sefe2Sefi_AMPA;
        I_out = g_conductance.*(Vsc - Ve).*Sum_S;
    case 'Sefe2Sefi_NMDA'
        g_conductance = Synaptic_p.g_Sefe2Sefi_NMDA;
        I_out = g_conductance.*(Vsc - Ve)./(1 + Mg.*exp(-0.062.*Vsc)./3.57).*Sum_S;  
    case 'Lipe2Sefi_AMPA'
        g_conductance = Synaptic_p.g_Lipe2Sefi_AMPA;
        I_out = g_conductance.*(Vsc - Ve).*Sum_S;
    case 'Lipe2Sefi_NMDA'
        g_conductance = Synaptic_p.g_Lipe2Sefi_NMDA;
        I_out = g_conductance.*(Vsc - Ve)./(1 + Mg.*exp(-0.062.*Vsc)./3.57).*Sum_S;    
    case 'Sce2Sefi_NMDA'
        g_conductance = Synaptic_p.g_Sce2Sefi_NMDA;
        I_out = g_conductance.*(Vsc - Ve)./(1 + Mg.*exp(-0.062.*Vsc)./3.57).*Sum_S;   
    %Sefii
    case 'Sefii_ext_AMPA'
        g_conductance = Synaptic_p.g_Sefii_ext_AMPA;
        I_out = g_conductance.*(Vsc - Ve).*Sum_S;
    case 'Sefii2Sefii_GABA'
        g_conductance = Synaptic_p.g_Sefii2Sefii_GABA;
        I_out = g_conductance.*(Vsc - Vi).*Sum_S;    
    case 'Sefe2Sefii_AMPA'
        g_conductance = Synaptic_p.g_Sefe2Sefii_AMPA;
        I_out = g_conductance.*(Vsc - Ve).*Sum_S;
    case 'Sefe2Sefii_NMDA'
        g_conductance = Synaptic_p.g_Sefe2Sefii_NMDA;
        I_out = g_conductance.*(Vsc - Ve)./(1 + Mg.*exp(-0.062.*Vsc)./3.57).*Sum_S; 
    case 'Lipe2Sefii_AMPA'            %我添加了Lipe2Sefii_AMPA
        g_conductance = Synaptic_p.g_Lipe2Sefii_AMPA;
        I_out = g_conductance.*(Vsc - Ve).*Sum_S;
   %Lipe
    case 'Lipe_ext_AMPA'
        g_conductance = Synaptic_p.g_Lipe_ext_AMPA;
        I_out = g_conductance.*(Vsc - Ve).*Sum_S;
    case 'Lipe2Lipe_rec_AMPA'
        g_conductance = Synaptic_p.g_Lipe2Lipe_rec_AMPA;
        I_out = g_conductance.*(Vsc - Ve).*Sum_S;
    case 'Lipe2Lipe_rec_NMDA'
        g_conductance = Synaptic_p.g_Lipe2Lipe_rec_NMDA;
        I_out = g_conductance.*(Vsc - Ve)./(1 + Mg.*exp(-0.062.*Vsc)./3.57).*Sum_S;
    case 'Lipi2Lipe_GABA'
        g_conductance = Synaptic_p.g_Lipi2Lipe_GABA;
        I_out = g_conductance.*(Vsc - Vi).*Sum_S;
    case 'Sce2Lipe_NMDA'
        g_conductance = Synaptic_p.g_Sce2Lipe_NMDA;
        I_out = g_conductance.*(Vsc - Ve)./(1 + Mg.*exp(-0.062.*Vsc)./3.57).*Sum_S;
    case 'Sefe2Lipe_AMPA'
        g_conductance = Synaptic_p.g_Sefe2Lipe_AMPA;
        I_out = g_conductance.*(Vsc - Ve).*Sum_S;
    case 'Sefe2Lipe_NMDA'
        g_conductance = Synaptic_p.g_Sefe2Lipe_NMDA;
        I_out = g_conductance.*(Vsc - Ve)./(1 + Mg.*exp(-0.062.*Vsc)./3.57).*Sum_S;
    %Lipi
    case 'Lipi_MT_AMPA'
        g_conductance = Synaptic_p.g_Lipi_MT_AMPA;
        I_out = g_conductance.*(Vsc - Ve).*Sum_S;
    case 'Lipi_ext_AMPA'
        g_conductance = Synaptic_p.g_Lipi_ext_AMPA;
        I_out = g_conductance.*(Vsc - Ve).*Sum_S;
    case 'Lipe2Lipi_AMPA'
        g_conductance = Synaptic_p.g_Lipe2Lipi_AMPA;
        I_out = g_conductance.*(Vsc - Ve).*Sum_S;
    case 'Lipe2Lipi_NMDA'
        g_conductance = Synaptic_p.g_Lipe2Lipi_NMDA;
        I_out = g_conductance.*(Vsc - Ve)./(1 + Mg.*exp(-0.062.*Vsc)./3.57).*Sum_S;
    case 'Lipi2Lipi_GABA'
        g_conductance = Synaptic_p.g_Lipi2Lipi_GABA;
        I_out = g_conductance.*(Vsc - Vi).*Sum_S;
    case 'Sce2Lipi_NMDA'
        g_conductance = Synaptic_p.g_Sce2Lipi_NMDA;
        I_out = g_conductance.*(Vsc - Ve)./(1 + Mg.*exp(-0.062.*Vsc)./3.57).*Sum_S;
    case 'Sefe2Lipi_AMPA'
        g_conductance = Synaptic_p.g_Sefe2Lipi_AMPA;
        I_out = g_conductance.*(Vsc - Ve).*Sum_S;
    case 'Sefe2Lipi_NMDA'
        g_conductance = Synaptic_p.g_Sefe2Lipi_NMDA;
        I_out = g_conductance.*(Vsc - Ve)./(1 + Mg.*exp(-0.062.*Vsc)./3.57).*Sum_S;
    %Cd1
    case 'Cd1_ext_AMPA'
        g_conductance = Synaptic_p.g_Cd1_ext_AMPA;
        I_out = g_conductance.*(Vsc - Ve).*Sum_S;
    case 'Sefe2Cd1_AMPA'
        g_conductance = Synaptic_p.g_Sefe2Cd1_AMPA;
        I_out = g_conductance.*(Vsc - Ve).*Sum_S;
    %Cd2
    case 'Cd2_ext_AMPA'
        g_conductance = Synaptic_p.g_Cd2_ext_AMPA;
        I_out = g_conductance.*(Vsc - Ve).*Sum_S;
    case 'Lipe2Cd2_AMPA'
        g_conductance = Synaptic_p.g_Lipe2Cd2_AMPA;
        I_out = g_conductance.*(Vsc - Ve).*Sum_S;
    %Sni
    case 'Sni_ext_AMPA'
        g_conductance = Synaptic_p.g_Sni_ext_AMPA;
        I_out = g_conductance.*(Vsc - Ve).*Sum_S;
    case 'Cd12Sni_GABA'
        g_conductance = Synaptic_p.g_Cd12Sni_GABA;
        I_out = g_conductance.*(Vsc - Vi).*Sum_S;
    case 'Cd22Sni_GABA'
        g_conductance = Synaptic_p.g_Cd22Sni_GABA;
        I_out = g_conductance.*(Vsc - Vi).*Sum_S;
    %Sce
    case 'Sce_ext_AMPA'
        g_conductance = Synaptic_p.g_Sce_ext_AMPA;
        I_out = g_conductance.*(Vsc - Ve).*Sum_S;
    case 'Sci2Sce_GABA'
        g_conductance = Synaptic_p.g_Sci2Sce_GABA;
        I_out = g_conductance.*(Vsc - Vi).*Sum_S;
    case 'Sni2Sce_GABA'
        g_conductance = Synaptic_p.g_Sni2Sce_GABA;
        I_out = g_conductance.*(Vsc - Vi).*Sum_S;
    case 'Sce2Sce_rec_NMDA'
        g_conductance = Synaptic_p.g_Sce2Sce_rec_NMDA;
        I_out = g_conductance.*(Vsc - Ve)./(1 + Mg.*exp(-0.062.*Vsc)./3.57).*Sum_S;
    case 'Sefe2Sce_AMPA'
        g_conductance = Synaptic_p.g_Sefe2Sce_AMPA;
        I_out = g_conductance.*(Vsc - Ve).*Sum_S;
    case 'Lipe2Sce_AMPA'
        g_conductance = Synaptic_p.g_Lipe2Sce_AMPA;
        I_out = g_conductance.*(Vsc - Ve).*Sum_S;
    %Sci
    case 'Sci_ext_AMPA'
        g_conductance = Synaptic_p.g_Sci_ext_AMPA;
        I_out = g_conductance.*(Vsc - Ve).*Sum_S;
    case 'Sci2Sci_GABA'
        g_conductance = Synaptic_p.g_Sci2Sci_GABA;
        I_out = g_conductance.*(Vsc - Vi).*Sum_S;
    case 'Sce2Sci_NMDA'
        g_conductance = Synaptic_p.g_Sce2Sci_NMDA;
        I_out = g_conductance.*(Vsc - Ve)./(1 + Mg.*exp(-0.062.*Vsc)./3.57).*Sum_S;
end


