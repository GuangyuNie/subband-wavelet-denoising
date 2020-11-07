function [Y] = pyramid22band(img,h1,g1)
% 4 equal subband
[rows,columns] = size(img);
  row_offset = 0;
  column_offset = 0;
  Y = analysis_filter_rows(img,rows,columns,row_offset,column_offset,h1,g1);

  row_offset = 0;
  column_offset = 0;
  Y = analysis_filter_columns(Y,rows/2,columns,row_offset,column_offset,h1,g1);
  row_offset = rows/2;
  column_offset = 0;
  Y = analysis_filter_columns(Y,rows/2,columns,row_offset,column_offset,h1,g1);

  row_offset = 0;
  column_offset = 0;
  Y = analysis_filter_rows(Y,rows/2,columns/2,row_offset,column_offset,h1,g1);

  row_offset = 0;
  column_offset = 0;
  Y = analysis_filter_columns(Y,rows/4,columns/2,row_offset,column_offset,h1,g1);
  row_offset = rows/4;
  column_offset = 0;
  Y = analysis_filter_columns(Y,rows/4,columns/2,row_offset,column_offset,h1,g1);

  row_offset = 0;
  column_offset = columns/2;
  Y = analysis_filter_rows(Y,rows/2,columns/2,row_offset,column_offset,h1,g1);

  row_offset = 0;
  column_offset = columns/2;
  Y = analysis_filter_columns(Y,rows/4,columns/2,row_offset,column_offset,h1,g1);
  row_offset = rows/4;
  column_offset = columns/2;
  Y = analysis_filter_columns(Y,rows/4,columns/2,row_offset,column_offset,h1,g1);

  row_offset = rows/2;
  column_offset = 0;
  Y = analysis_filter_rows(Y,rows/2,columns/2,row_offset,column_offset,h1,g1);

  row_offset = rows/2;
  column_offset = 0;
  Y = analysis_filter_columns(Y,rows/4,columns/2,row_offset,column_offset,h1,g1);
  row_offset = rows/2 + rows/4;
  column_offset = 0;
  Y = analysis_filter_columns(Y,rows/4,columns/2,row_offset,column_offset,h1,g1);


  row_offset = rows/2;
  column_offset = columns/2;
  Y = analysis_filter_rows(Y,rows/2,columns/2,row_offset,column_offset,h1,g1);

  row_offset = rows/2;
  column_offset = columns/2;
  Y = analysis_filter_columns(Y,rows/4,columns/2,row_offset,column_offset,h1,g1);
  row_offset = rows/2 + rows/4;
  column_offset = columns/2;
  Y = analysis_filter_columns(Y,rows/4,columns/2,row_offset,column_offset,h1,g1);

  row_offset = 0;
  column_offset = 0;
  Y = analysis_filter_rows(Y,rows/4,columns/4,row_offset,column_offset,h1,g1);

  row_offset = 0;
  column_offset = 0;
  Y = analysis_filter_columns(Y,rows/8,columns/4,row_offset,column_offset,h1,g1);
  row_offset = rows/8;
  column_offset = 0;
  Y = analysis_filter_columns(Y,rows/8,columns/4,row_offset,column_offset,h1,g1);

  row_offset = 0;
  column_offset = 0;
  Y = analysis_filter_rows(Y,rows/8,columns/8,row_offset,column_offset,h1,g1);

  row_offset = 0;
  column_offset = 0;
  Y = analysis_filter_columns(Y,rows/16,columns/8,row_offset,column_offset,h1,g1);
  row_offset = rows/16;
  column_offset = 0;
  Y = analysis_filter_columns(Y,rows/16,columns/8,row_offset,column_offset,h1,g1);

end

