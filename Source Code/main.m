
%input user
disp('Periode: hourly, weekly, monthly, quarterly, yearly');
periode = input('periode = ', 's');
kel_pengerjaan = 1 %input ('Kelompok pengerjaan (1/2) =');

if kel_pengerjaan ==1
   %membuka file
    C1 = baca_file('010101_191231_Beijing', '.lev20');
    C2 = baca_file('010101_191231_Beijing', '.ssa');
    C3 = baca_file('010101_191231_Beijing', '.tab');
    C4 = baca_file('970101_191231_Dalanzadgad', '.lev20');
    C5 = baca_file('970101_191130_Dalanzadgad', '.ssa');
    C6 = baca_file('970101_191130_Dalanzadgad', '.tab');
    C7 = baca_file('990101_151231_Solar_Village', '.lev20');
    C8 = baca_file('990101_151231_Solar_Village', '.ssa');
    C9 = baca_file('990101_151231_Solar_Village', '.tab');
    
   %praproses
    beijing = praproses( C1, C2, C3, periode ); %merge and calculate mean by periode
    dalanzagdad = praproses( C4, C5, C6, periode );
    solarVillage = praproses( C7, C8, C9, periode );
    
    %treat outlier and NaN value
    beijing = outlier_nan( beijing );
    dalanzagdad = outlier_nan( dalanzagdad );
    solarVillage = outlier_nan( solarVillage );
    
    %hitung variabel baru
    [beijing_train, beijing_val] = hitung_variable_baru( beijing, 1 ,1 );
    [dalanzagdad_train, dalanzagdad_val] = hitung_variable_baru( dalanzagdad, 1, 2 );
    [solarVillage_train, solarVillage_val] = hitung_variable_baru( solarVillage, 1, 3 );
    
    whos beijing_train
    whos beijing_val
    
    beijing_train
    
end


