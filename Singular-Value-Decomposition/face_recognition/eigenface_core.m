%%% For explanations follow each steps from PDF %%%

function [m A eigenfaces pr_img] = eigenface_core(database_path)
  %Place where are the images of reference
  director = dir(fullfile(database_path, '*.jpg'));

  index = 1;
  value = 200;
  %Step 1
  while index <= 10
      matrice = double(rgb2gray(imread(fullfile(database_path,
                director(index).name))));
      [row column] = size(matrice);
      for i = 1 : row
        T(((i - 1) * value + 1):i*value, index) = matrice(i,:);
      end
      index = index + 1;
   end
   %Step 2
   [row column] = size(T);
   m = zeros(row, column);
   for i = 1 : row
        m(i,:) = sum(T(i,:))/column;
     %Step 3
     for j = 1 : column 
       A(i,j) = T(i,j) - (sum(T(i,:))/column);
     end
   end
  
  %Step 4
  A_transpose = A';
  [U S V] = svd(A_transpose * A);
  eigenfaces = A * V;
  
  %Step 5
  pr_img = eigenfaces' * A;
    
end