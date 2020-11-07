function [Y] = dyadic16band(img,h,g)
% 4 equal subband
[rows,columns] = size(img);
row_offset = 0;
column_offset = 0;
Y = analysis_filter_rows(img,rows,columns,row_offset,column_offset,h,g);

row_offset = 0;
column_offset = 0;
Y = analysis_filter_columns(Y,rows/2,columns,row_offset,column_offset,h,g);
row_offset = rows/2;
column_offset = 0;
Y = analysis_filter_columns(Y,rows/2,columns,row_offset,column_offset,h,g);

% LL1 -> 4 equal subband
row_offset = 0;
column_offset = 0;
Y = analysis_filter_rows(Y,rows/2,columns/2,row_offset,column_offset,h,g);

row_offset = 0;
column_offset = 0;
Y = analysis_filter_columns(Y,rows/4,columns/2,row_offset,column_offset,h,g);
row_offset = rows/4;
column_offset = 0;
Y = analysis_filter_columns(Y,rows/4,columns/2,row_offset,column_offset,h,g);

% LL1  -> LL2 -> 4 equal subband
row_offset = 0;
column_offset = 0;
Y = analysis_filter_rows(Y,rows/4,columns/4,row_offset,column_offset,h,g);

row_offset = 0;
column_offset = 0;
Y = analysis_filter_columns(Y,rows/8,columns/4,row_offset,column_offset,h,g);
row_offset = rows/8;
column_offset = 0;
Y = analysis_filter_columns(Y,rows/8,columns/4,row_offset,column_offset,h,g);

% LL1  -> LL2 -> LL3 -> 4 equal subband
row_offset = 0;
column_offset = 0;
Y = analysis_filter_rows(Y,rows/8,columns/8,row_offset,column_offset,h,g);

row_offset = 0;
column_offset = 0;
Y = analysis_filter_columns(Y,rows/16,columns/8,row_offset,column_offset,h,g);
row_offset = rows/16;
column_offset = 0;
Y = analysis_filter_columns(Y,rows/16,columns/8,row_offset,column_offset,h,g);

% LL1  -> LL2 -> LL3 ->  LL4 -> 4 equal subband
row_offset = 0;
column_offset = 0;
Y = analysis_filter_rows(Y,rows/16,columns/16,row_offset,column_offset,h,g);

row_offset = 0;
column_offset = 0;
Y = analysis_filter_columns(Y,rows/32,columns/16,row_offset,column_offset,h,g);
row_offset = rows/32;
column_offset = 0;
Y = analysis_filter_columns(Y,rows/32,columns/16,row_offset,column_offset,h,g);
end

