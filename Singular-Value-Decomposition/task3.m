%%% For explanations follow each steps from PDF %%%

function [A_k S] = task3(image, k)
  
  %Pixels matrix reading
  image_matrix = double(imread(image));
  
  %Dimensions of pixels matrix
  [row column] = size(image_matrix);
  average_vect = zeros(row,1);
  i = 1;
 
  %Calculate average for each array and make a new image_matrix
   while(i <= row)
      %Step 1
      average_vect(i) = sum(image_matrix(i,:)) / column; 
      %Step 2
      image_matrix(i,:) = image_matrix(i,:) - average_vect(i);
      i = i + 1;
   end
 
  %Step 3
  Z = image_matrix'/sqrt(column - 1);
  
  %Step 4
  [U S V] = svd(Z);
  
  %Step 5
  W = V(:,1:k);
  
  %step 6
  Y = W' * image_matrix;
  
  %Step 7
  A_k = W * Y + average_vect;
end