%%% For explanations follow each steps from PDF %%%

function [A_k S] = task4(image, k)
  
  %Read pixels matrix
  image_matrix = double(imread(image));

  %Dimensions of matrix
  [row column] = size(image_matrix);
  average_vect = zeros(row,1);
  i = 1;
  
  %Calculate average for each array and make a new image_matrix
  while(i <= row)
    %Step 1
    average_vect(i) = sum(image_matrix(i,:))/column;
    %Step 2
    image_matrix(i,:) = image_matrix(i,:) - average_vect(i);
    i = i + 1;
  end
  
  %Step 3
  image_matrix_transpose = image_matrix';

  %Step 4
  Z = image_matrix*(image_matrix_transpose*1/(column-1));
  
  %Step 5
  [V S] = eig(Z);
  
  %Step 6
  W = V(:,1:k);

  %Step 7
  Y = W' * image_matrix;
  
  %Step 8
  A_k = W*Y + average_vect;
 end
