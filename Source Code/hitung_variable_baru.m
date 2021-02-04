function [data_train, data_val] = hitung_variable_baru( data, jenis_data, data_ke )
%keterangan:
%jenis_data == 1 ---> kelompok data A1DS, A2BB, dan A3AP
%jenis data == 2 ---> kelompok data A4OC dan A5CO
%data_ke : index stasiun sesuai urutan Tabel 1

    %menghitung NSSA
    NSSA_440 = array2table(1-(data.('AOTAbsp440_T')./data.('AOT_440')), 'VariableNames', {'NSSA_440'});
    NSSA_675 = array2table(1-(data.('AOTAbsp675_T')./data.('AOT_675')), 'VariableNames', {'NSSA_675'});
    NSSA_870 = array2table(1-(data.('AOTAbsp870_T')./data.('AOT_870')), 'VariableNames', {'NSSA_870'});
    NSSA_1020 = array2table(1-(data.('AOTAbsp1020_T')./data.('AOT_1020')), 'VariableNames', {'NSSA_1020'});
    hasil = [data NSSA_440 NSSA_675 NSSA_870 NSSA_1020 ];
        
    %menghitung alfa dan beta
    %alfa_beta_1 = fminsearch(@(par_fit) myfunc(par_fit,[440,500],[hasil.('440'), hasil.('AOT_500')]),rand(1,2))
    %alfa_beta_2 = fminsearch(@(par_fit) myfunc(par_fit,[500,675],[hasil.('AOT_500'), hasil.('AOT_675')]),rand(1,2))
    %alfa_beta_3 = fminsearch(@(par_fit) myfunc(par_fit,[500,675],[hasil.('AOT_500'), hasil.('AOT_675')]),rand(1,2))
   
    %menghitung AOT untuk lambda = 470,550, dan 660
    AOT_470 = array2table(data.('AOT_440').*((470/440).^(-data.('lambda_440_675'))), 'VariableNames', {'AOT_470'});
    AOT_550 = array2table(data.('AOT_500').*((550/500).^(-data.('lambda_440_675'))), 'VariableNames', {'AOT_550'});
    AOT_660 = array2table(data.('AOT_500').*((660/500).^(-data.('lambda_440_675'))), 'VariableNames', {'AOT_660'});
    hasil = [hasil AOT_470 AOT_550 AOT_660];

    %menghitung slope
    slope_A = array2table((hasil.('AOT_660') - hasil.('AOT_470'))/(660-470), 'VariableNames', {'slope_A'});
    slope_B = array2table((hasil.('AOT_870') - hasil.('AOT_470'))/(870-470), 'VariableNames', {'slope_B'});
    slope_C = array2table((hasil.('AOT_1020') - hasil.('AOT_470'))/(1020-470), 'VariableNames', {'slope_C'});
    hasil = [hasil slope_A slope_B slope_C]
    
    %menghitung index01
    index01_A = array2table(hasil.('slope_A')./ hasil.('AOT_470') , 'VariableNames', {'index01_A'});
    index01_B = array2table(hasil.('slope_A')./ hasil.('AOT_660') , 'VariableNames', {'index01_B'});
    index01_C = array2table(hasil.('slope_A')./ hasil.('AOT_870') , 'VariableNames', {'index01_C'});
    index01_D = array2table(hasil.('slope_A')./ hasil.('AOT_1020') , 'VariableNames', {'index01_D'});
    hasil = [hasil index01_A index01_B index01_C index01_D];

    %menghitung index02
    index02_A = array2table((hasil.('AOT_470') -(2.*hasil.('AOT_550'))+ hasil.('AOT_660')) ./(470-660)  , 'VariableNames', {'index02_A'});
    index02_B = array2table((hasil.('AOT_470') -(2.*hasil.('AOT_660'))+ hasil.('AOT_870')) ./(470-660)  , 'VariableNames', {'index02_B'});
    hasil = [hasil index02_A index02_B];
%     
%     %menghitung stat dasar
%     nssa, aot, slope, index01, index02

%     
% %     %split data
% %     [ data_train, data_val ] = split_data( hasil, data_ke )
% %     
% %     %apply filter
% %     if jenis_data==1
% %        condition1 = data_train.AOT_550 > 0.8;
% %        condition2 = data_val.AOT_550 >= 0.8;
% %        data_train = data_train(condition1,:);
% %        data_val = data_val(condition2,:);
% %     elseif jenis_data==2
% %        condition1 = data_train.AOT_550 < 0.4;
% %        condition2 = data_val.AOT_550 <= 0.4;
% %        data_train = data_train(condition1,:);
% %        data_val = data_val(condition2,:);
% %     end
%     
    
    
end

