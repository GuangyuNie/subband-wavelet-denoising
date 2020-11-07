function [Y] = pyramid_reconstruct(Y,h2,g2)
% Reconstruct
[rows,columns] = size(Y);
  row_offset = 0;
  column_offset = 0;
  Y = synthesis_filter_columns(Y,rows/16,columns/16,row_offset,column_offset,h2,g2);
  row_offset = rows/16;
  column_offset = 0;
  Y = synthesis_filter_columns(Y,rows/16,columns/16,row_offset,column_offset,h2,g2);

  row_offset = 0;
  column_offset = 0;
  Y = synthesis_filter_rows(Y,rows/16,columns/8,row_offset,column_offset,h2,g2);


  row_offset = 0;
  column_offset = 0;
  Y = synthesis_filter_columns(Y,rows/8,columns/8,row_offset,column_offset,h2,g2);
  row_offset = rows/8;
  column_offset = 0;
  Y = synthesis_filter_columns(Y,rows/8,columns/8,row_offset,column_offset,h2,g2);

  row_offset = 0;
  column_offset = 0;
  Y = synthesis_filter_rows(Y,rows/8,columns/4,row_offset,column_offset,h2,g2);


  row_offset = 0;
  column_offset = 0;
  Y = synthesis_filter_columns(Y,rows/4,columns/4,row_offset,column_offset,h2,g2);
  row_offset = rows/4;
  column_offset = 0;
  Y = synthesis_filter_columns(Y,rows/4,columns/4,row_offset,column_offset,h2,g2);

  row_offset = 0;
  column_offset = 0;
  Y = synthesis_filter_rows(Y,rows/4,columns/2,row_offset,column_offset,h2,g2);

  row_offset = 0;
  column_offset = columns/2;
  Y = synthesis_filter_columns(Y,rows/4,columns/4,row_offset,column_offset,h2,g2);
  row_offset = rows/4;
  column_offset = columns/2;
  Y = synthesis_filter_columns(Y,rows/4,columns/4,row_offset,column_offset,h2,g2);

  row_offset = 0;
  column_offset = columns/2;
  Y = synthesis_filter_rows(Y,rows/4,columns/2,row_offset,column_offset,h2,g2);

  row_offset = rows/2;
  column_offset = 0;
  Y = synthesis_filter_columns(Y,rows/4,columns/4,row_offset,column_offset,h2,g2);
  row_offset = rows/2 + rows/4;
  column_offset = 0;
  Y = synthesis_filter_columns(Y,rows/4,columns/4,row_offset,column_offset,h2,g2);

  row_offset = rows/2;
  column_offset = 0;
  Y = synthesis_filter_rows(Y,rows/4,columns/2,row_offset,column_offset,h2,g2);

  row_offset = rows/2;
  column_offset = columns/2;
  Y = synthesis_filter_columns(Y,rows/4,columns/4,row_offset,column_offset,h2,g2);
  row_offset = rows/2 + rows/4;
  column_offset = columns/2;
  Y = synthesis_filter_columns(Y,rows/4,columns/4,row_offset,column_offset,h2,g2);

  row_offset = rows/2;
  column_offset = columns/2;
  Y = synthesis_filter_rows(Y,rows/4,columns/2,row_offset,column_offset,h2,g2);


  row_offset = 0;
  column_offset = 0;
  Y = synthesis_filter_columns(Y,rows/2,columns/2,row_offset,column_offset,h2,g2);
  row_offset = rows/2;
  column_offset = 0;
  Y = synthesis_filter_columns(Y,rows/2,columns/2,row_offset,column_offset,h2,g2);
  
  row_offset = 0;
  column_offset = 0;
  Y = synthesis_filter_rows(Y,rows/2,columns,row_offset,column_offset,h2,g2);

Y(Y>1) = 1;
Y(Y<0) = 0;
end

