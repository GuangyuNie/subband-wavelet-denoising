function [img] = analysis_filter_columns(img,rows,columns,row_offset,column_offset,h,g)
N = columns;
delay = 5;
filter_taps = 9;
for row = row_offset+1:row_offset+rows
    % extension part
    % 
    for n = 1:delay-1
        x1(n) = img(row,delay+1-n+column_offset);
    end
    for n = 1:N
        x1(n+delay-1) = img(row,n+column_offset);
    end
    for  n = N:N+delay-2
        x1(n+delay) = img(row,2*N-n-1+column_offset);
    end
    
    for n = 1:N+2*(delay-1)
        x2(n) = x1(n);
    end
    
    for m = 1:2:N
        sum = 0;
        for n = m-filter_taps:m-1
            sum = sum + x1(n+filter_taps)*h(m-n);
        end
        z1(m) = sum;
    end
    
    if size(z1)<N
        z1(N) = 0;
    end
    
    for m = 2:2:N
        sum = 0;
        for n = m-filter_taps:m-1
            sum = sum + x2(n+filter_taps)*g(m-n);
        end
        z2(m) = sum;
    end
    
    if size(z2)<N
        z2(N) = 0;
    end
    
    for column = 1:columns/2
        img(row,column+column_offset) = z1(column*2-1);
    end
    
    for column = 1:columns/2
        img(row,column+column_offset+columns/2) = z2(column*2);
    end
    
end

end
