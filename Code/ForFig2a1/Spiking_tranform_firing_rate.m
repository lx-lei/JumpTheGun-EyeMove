function Firing_rate = Spiking_tranform_firing_rate(current_time, Model_strc, Sefe_pop_spike, Sefi_pop_spike, Sefii_pop_spike, ...
    lipe_pop_spike, lipi_pop_spike, cd1_pop_spike, cd2_pop_spike, sni_pop_spike, sce_pop_spike, sci_pop_spike)

time_window = Model_strc.time_window;%ms
darta_time = Model_strc.darta_time;%ms
Firing_rate = [];

if current_time >= time_window
    if rem(current_time, darta_time) == 0
            Firing_rate(1, 1) = current_time - time_window/2;
        
            index_time_sefe = find( Sefe_pop_spike(:, 2) >= Firing_rate(1, 1) - time_window/2 ...
                                 & Sefe_pop_spike(:, 2) < Firing_rate(1, 1) + time_window/2);
            index_time_sefi = find( Sefi_pop_spike(:, 2) >= Firing_rate(1, 1) - time_window/2 ...
                                 & Sefi_pop_spike(:, 2) < Firing_rate(1, 1) + time_window/2);
            index_time_sefii = find( Sefii_pop_spike(:, 2) >= Firing_rate(1, 1) - time_window/2 ...
                                 & Sefii_pop_spike(:, 2) < Firing_rate(1, 1) + time_window/2);
            index_time_lipe = find( lipe_pop_spike(:, 2) >= Firing_rate(1, 1) - time_window/2 ...
                                 & lipe_pop_spike(:, 2) < Firing_rate(1, 1) + time_window/2);
            index_time_lipi = find( lipi_pop_spike(:, 2) >= Firing_rate(1, 1) - time_window/2 ...
                                 & lipi_pop_spike(:, 2) < Firing_rate(1, 1) + time_window/2);
            index_time_cd1 = find( cd1_pop_spike(:, 2) >= Firing_rate(1, 1) - time_window/2 ...
                                 & cd1_pop_spike(:, 2) < Firing_rate(1, 1) + time_window/2);
            index_time_cd2 = find( cd2_pop_spike(:, 2) >= Firing_rate(1, 1) - time_window/2 ...
                                 & cd2_pop_spike(:, 2) < Firing_rate(1, 1) + time_window/2);
            index_time_sni = find( sni_pop_spike(:, 2) >= Firing_rate(1, 1) - time_window/2 ...
                                 & sni_pop_spike(:, 2) < Firing_rate(1, 1) + time_window/2);
            index_time_sce = find( sce_pop_spike(:, 2) >= Firing_rate(1, 1) - time_window/2 ...
                                 & sce_pop_spike(:, 2) < Firing_rate(1, 1) + time_window/2); 
            index_time_sci = find( sci_pop_spike(:, 2) >= Firing_rate(1, 1) - time_window/2 ...
                                 & sci_pop_spike(:, 2) < Firing_rate(1, 1) + time_window/2);                  
            Firing_rate(1, 2) = length(index_time_sefe)/Model_strc.Num_of_Sefe/time_window*1000;
            Firing_rate(1, 3) = length(index_time_sefi)/Model_strc.Num_of_Sefi/time_window*1000;
            Firing_rate(1, 4) = length(index_time_sefii)/Model_strc.Num_of_Sefii/time_window*1000;
            Firing_rate(1, 5) = length(index_time_lipe)/Model_strc.Num_of_Lipe/time_window*1000;
            Firing_rate(1, 6) = length(index_time_lipi)/Model_strc.Num_of_Lipi/time_window*1000;
            Firing_rate(1, 7) = length(index_time_cd1)/Model_strc.Num_of_Cd1/time_window*1000;
            Firing_rate(1, 8) = length(index_time_cd2)/Model_strc.Num_of_Cd2/time_window*1000;
            Firing_rate(1, 9) = length(index_time_sni)/Model_strc.Num_of_Sni/time_window*1000;
            Firing_rate(1, 10) = length(index_time_sce)/Model_strc.Num_of_Sce/time_window*1000;
            Firing_rate(1, 11) = length(index_time_sci)/Model_strc.Num_of_Sci/time_window*1000;
    end
end
