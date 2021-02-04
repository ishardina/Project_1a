function T = praproses( data1, data2, data3, periode )
    
    %retime sesuai periode dan menghitung rata-rata
    T1 = retime(data1, periode,  @(x) mean(x,'omitnan'));
    T2 = retime(data2, periode,  @(x) mean(x,'omitnan'));
    T3 = retime(data3, periode,  @(x) mean(x,'omitnan'));
    
    %merge ketiga tabel
    T = innerjoin(T1,T2,'Keys','Date_Time');
    T = innerjoin(T,T3,'Keys','Date_Time');
end

