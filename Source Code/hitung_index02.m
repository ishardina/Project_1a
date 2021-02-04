function hasil = hitung_index02(AOT1, AOT2, AOT3, lambda1, lambda2, lambda3)

    %menghitung index02 dengan rumus 6a-6f
    index02_a = array2table((AOT1 -(2.*AOT2)+ AOT3) ./(lambda3-lambda1)  , 'VariableNames', {'index02_A'});
    index02_b = array2table(((AOT1 -(2.*AOT2) + AOT3) ./ AOT3) ./(lambda1-lambda2).^2  , 'VariableNames', {'index02_A'});
    index02_c = array2table(((AOT1 -(2.*AOT2) + AOT3) ./(lambda1-lambda2).^2 ) ./ AOT1  , 'VariableNames', {'index02_A'});
    index02_d = array2table((lambda3-lambda1./6).*(AOT1 -(4.*AOT2) + AOT3) , 'VariableNames', {'index02_A'});
    index02_e = array2table(((AOT3-AOT1)./6).*(lambda1 -(4.*lambda2) + lambda3)  , 'VariableNames', {'index02_A'});
    
    %f = @(x) 
    %index02_f = array2table(  , 'VariableNames', {'index02_A'});
    

end

