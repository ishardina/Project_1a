function C1 = baca_file(namaFile, ekstensi)
if isequal(ekstensi,'.lev20')
    fmt_lev20 = ['%s %s', repmat(' %f',[1,41]), ' %s', repmat(' %f', [1,37])];
    fid = fopen(strcat(namaFile,ekstensi), 'rt');
    C1 = textscan(fid, fmt_lev20,'headerLines', 5, 'Delimiter',',','TreatAsEmpty','N/A');
    fclose(fid);
    varName = {'Date_Time', 'AOT_1020', 'AOT_870', 'AOT_675', 'AOT_500', 'AOT_440', 'AOT_380', 'AOT_340', 'Water_cm', 'lambda_440_870', 'lambda_380_500', 'lambda_440_675', 'lambda_500_870', 'lambda_340_440'};
    D = array2table([C1{5:7} C1{13} C1{16} C1{18:20} C1{38:42}]);

elseif isequal(ekstensi,'.ssa') 
    fmt_ssa = ['%s %s', repmat('%f',[1,5]), ' %s', repmat('%f',[1,29]), '%s'];
    fid = fopen(strcat(namaFile,ekstensi), 'rt');
    C1 = textscan(fid, fmt_ssa,'headerLines', 4, 'Delimiter',',','TreatAsEmpty','N/A');
    fclose(fid);
    varName = {'Date_Time','SSA440_T', 'SSA675_T', 'SSA870_T', 'SSA1020_T', 'solar_zenith_angle_for_1020nm_scan', 'albedo_440','albedo_675', 'albedo_870', 'albedo_1020', 'average_solar_zenith_angle_for_flux_calculation'};
    D = array2table([C1{4:7} C1{10} C1{33:37}]);

elseif isequal(ekstensi,'.tab')  
    fmt_tab = ['%s %s', repmat('%f', [1,6]), '%s', repmat('%f',[1,29]), '%s'];
    fid = fopen(strcat(namaFile,ekstensi), 'rt');
    C1 = textscan(fid, fmt_tab,'headerLines', 4, 'Delimiter',',','TreatAsEmpty','N/A');
    fclose(fid);
    varName = {'Date_Time','AOTAbsp440_T', 'AOTAbsp675_T', 'AOTAbsp870_T', 'AOTAbsp1020_T', 'lambda_870_440Param','alpha440_870', 'tau440_measured', 'sphericity';};
    D = array2table([C1{4:8} C1{14:16}]);
end

%convert to timetable
C = strcat(C1{1},{' '}, C1{2});
C = cell2table(C); 
C1=[C D];
C1.Properties.VariableNames = varName;
C1.Date_Time = datetime(C1.Date_Time,'InputFormat','dd:MM:yyyy HH:mm:ss');
C1 = table2timetable(C1);
end