function [img] = analysis_filter_rows(img,rows,columns,row_offset,column_offset,h,g)
N = rows;
delay = 5;
filter_taps = 9;
for col = column_offset+1:column_offset+columns
    x1 = [];
    x2 = [];
    % extension part
    % 
    for n = 1:delay-1
        x1(n) = img(delay+1-n+row_offset,col);
    end
    for n = 1:N
        x1(n+delay-1) = img(n+row_offset,col);
    end
    for  n = N:N+delay-2
        x1(n+delay) = img(2*N-n-1+row_offset,col);
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
        z1(N) = 0
    end
    for m = 2:2:N
        sum = 0;
        for n = m-filter_taps:m-1
            sum = sum + x2(n+filter_taps)*g(m-n);
        end
        z2(m) = sum;
    end
    if size(z2)<N
        z2(N) = 0
    end
    for row = 1:rows/2
        img(row+row_offset,col) = z1(row*2-1);
    end
    
    for row = 1:rows/2
        img(row+row_offset+rows/2,col) = z2(row*2);
    end
    
end

end
