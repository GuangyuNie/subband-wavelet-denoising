function [img] = synthesis_filter_columns(img,rows,columns,row_offset,column_offset,h,g)
delay = 5;
hdelay = ceil(delay/2)
filter_taps = 9;
N = columns * 2;

for row = row_offset+1:rows+row_offset
    for n = 1:hdelay
        x1(n) = img(row,hdelay-n+column_offset+1);
    end
    for n=1:columns
        x1(n+hdelay) = img(row,n+column_offset);
    end
    for n = columns:columns+hdelay-1
        x1(n+hdelay+1) = img(row,2*columns-n+column_offset);
    end
    
    for n = 1:columns+delay+1
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
      x2(n) = img(row,hdelay-n+1+column_offset+rows);
    end
    for n=1:columns
      x2(n+hdelay) = img(row,n+column_offset+rows);
    end
    for n=columns:columns+hdelay-1
      x2(n+hdelay+1) = img(row,2*columns-n+column_offset+columns);
    end

    for n=1:columns+delay+1
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

    for column=1:N
      img(row,column+column_offset) =  2*(z1(column) + z2(column));
    end
end
end