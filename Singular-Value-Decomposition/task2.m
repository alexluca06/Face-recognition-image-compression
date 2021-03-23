%%% For explanations follow each steps from PDF %%%

function task2(image)
  
  %First graph
  A = double(imread(image));
  [U S V] = svd(A);
  [row column]  = size(A);
  minimum = min(row,column);
  k = [1:19 20:20:99 100:30:minimum];
  subplot(2,2,1);
  plot(diag(S));
  
  %Second graph
  vect_dvs = zeros(1, length(k));
  sum_min = 0;
  i = 1;
  while i <= minimum
    sum_min = sum_min + S(i,i);
    i = i + 1;
  end
  j = 1;
  while j <= length(k);
    sum_k = 0;
    for i = 1 : k(j)
      sum_k = sum_k + S(i,i);
    endfor
    vect_dvs(j) = sum_k/sum_min;
    j = j + 1;
  end
    
  subplot(2,2,2);
  plot(k, vect_dvs);

   %The third graph
   vect_err = zeros(1, length(k));
    p = 1;
    while p  <= length(k)
      sum_i = 0;
      A_k = task1(image,k(p));
      for i = 1  : row
        sum_j = 0;
        for j = 1 : column
          sum_j = sum_j + (A(i,j) - A_k(i,j))^2;
        end
        sum_i = sum_i + sum_j;
      end
      vect_err(p++) = suma_i * (1 / (row * column));
     
    end
  
  subplot(2,2,3);
  plot(k,vect_err);
 
  %The fourth graph 
  
  vect_compr = zeros(1,length(k));
  p = 1;
  while p <= length(k)
    vect_compr(p) = k(p) * row + k(p) * column + k(p);
    p = p + 1;
  end
  
  vect_compr = vect_compr * (1 / (row * column));
   
  subplot(2,2,4);
  plot(k,vect_compr);
  
 
 end