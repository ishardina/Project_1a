function [ data_train, data_val ] = split_data( data, data_ke )

    %split data
 if data_ke==1
    TR_train = timerange(datetime('1997-04-01','InputFormat','yyyy-MM-dd'), datetime('2012-05-01', 'InputFormat','yyyy-MM-dd'));
    data_train = data(TR_train,:);
    TR_val = timerange(datetime('2013-04-01','InputFormat','yyyy-MM-dd'), datetime('2019-05-01', 'InputFormat','yyyy-MM-dd'));
    data_val = data(TR_val,:);
    
    apr = data_train.Date_Time.Month == 4;
    mei = data_train.Date_Time.Month == 5;
    apr1 = data_val.Date_Time.Month == 4;
    mei1 = data_val.Date_Time.Month == 5;
    data_train = [data_train(apr,:); data_train(mei,:)];
    data_val = [data_val(apr1,:); data_val(mei1,:)];
    
 elseif data_ke==2
    TR_train = timerange(datetime('2001-04-01','InputFormat','yyyy-MM-dd'), datetime('2012-05-01', 'InputFormat','yyyy-MM-dd'));
    data_train = data(TR_train,:);
    TR_val = timerange(datetime('2013-04-01','InputFormat','yyyy-MM-dd'), datetime('2019-05-01', 'InputFormat','yyyy-MM-dd'));
    data_val = data(TR_val,:);
    
    apr = data_train.Date_Time.Month == 4;
    mei = data_train.Date_Time.Month == 5;
    apr1 = data_val.Date_Time.Month == 4;
    mei1 = data_val.Date_Time.Month == 5;
    data_train = [data_train(apr,:); data_train(mei,:)];
    data_val = [data_val(apr1,:); data_val(mei1,:)];
 
 elseif data_ke==3
    TR_train = timerange(datetime('1999-04-01','InputFormat','yyyy-MM-dd'), datetime('2012-05-01', 'InputFormat','yyyy-MM-dd'));
    data_train = data(TR_train,:);
    TR_val = timerange(datetime('2013-04-01','InputFormat','yyyy-MM-dd'), datetime('2015-05-01', 'InputFormat','yyyy-MM-dd'));
    data_val = data(TR_val,:);
    
    apr = data_train.Date_Time.Month == 4;
    mei = data_train.Date_Time.Month == 5;
    apr1 = data_val.Date_Time.Month == 4;
    mei1 = data_val.Date_Time.Month == 5;
    data_train = [data_train(apr,:); data_train(mei,:)];
    data_val = [data_val(apr1,:); data_val(mei1,:)];
  
 elseif data_ke==4
    TR_train = timerange(datetime('2006-03-01','InputFormat','yyyy-MM-dd'), datetime('2012-05-01', 'InputFormat','yyyy-MM-dd'));
    data_train = data(TR_train,:);
    TR_val = timerange(datetime('2013-03-01','InputFormat','yyyy-MM-dd'), datetime('2020-05-01', 'InputFormat','yyyy-MM-dd'));
    data_val = data(TR_val,:);
    
    mar = data_train.Date_Time.Month == 3;
    apr = data_train.Date_Time.Month == 4;
    mei = data_train.Date_Time.Month == 5;
    mar1 = data_val.Date_Time.Month == 3;
    apr1 = data_val.Date_Time.Month == 4;
    mei1 = data_val.Date_Time.Month == 5;
    data_train = [data_train(mar,:); data_train(apr,:); data_train(mei,:)];
    data_val = [data_val(mar1,:); data_val(apr1,:); data_val(mei1,:)];
 end  
    
    data_train = sortrows(data_train,'Date_Time');
    data_val = sortrows(data_val,'Date_Time');


end

