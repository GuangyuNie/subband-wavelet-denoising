function [img] = synthesis_filter_rows(img,rows,columns,row_offset,column_offset,h,g)
delay = 5;
hdelay = ceil(delay/2)
filter_taps = 9;
N = rows * 2;

for column = column_offset+1:columns+column_offset
    for n = 1:hdelay
        x1(n) = img(hdelay-n+row_offset+1,column);
    end
    for n=1:rows
        x1(n+hdelay) = img(n+row_offset,column);
    end
    for n = rows:rows+hdelay-1
        x1(n+hdelay+1) = img(2*rows-n+row_offset,column);
    end
    
    for n = 1:rows+delay+1
        temp(2*n) = 0;
        temp(2*n-1) = x1(n);
    end

    for m = 1:2:N
        sum = 0;
        for n = m-filter_taps:2:m
            sum = sum+temp(n+filter_taps+2)*h(m-n);
        end
        z1(m) = sum;
    
        sum = 0;
        for n = m-filter_taps+2:2:m
           sum = sum+temp(n+filter_taps+2)*h(m-n+1);
        end
        z1(m+1) = sum;
    end
    
    
    for n=1:hdelay
      x2(n) = img(hdelay-n+1+row_offset+rows,column);
    end
    for n=1:rows
      x2(n+hdelay) = img(n+row_offset+rows,column);
    end
    for n=rows:rows+hdelay-1
      x2(n+hdelay+1) = img(2*rows-n+row_offset+rows,column);
    end

    for n=1:rows+delay+1
      temp(2*n-1) = 0.0;
      temp(2*n) = x2(n);
    end
    

    for m=1:2:N
      sum = 0.0;
      for n=m-filter_taps:2:m-2
        sum = sum+ temp(n+filter_taps+3)*g(m-n-1);
      end
      z2(m) = sum;

      sum = 0.0;
      for n=m-filter_taps:2:m-1
        sum = sum + temp(n+filter_taps+3)*g(m-n);
      end
      z2(m+1) = sum;
    end

    for row=1:N
      img(row+row_offset,column) = 2*(z1(row) + z2(row));
    end
end
end
