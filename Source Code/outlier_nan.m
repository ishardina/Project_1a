function clean_data = outlier_nan( data )

 %remove missing value
 data = rmmissing(data); 
 
 %Replace the outlier with the nearest element that is not an outlier
  clean_data = filloutliers(data,'nearest','mean'); 
end

