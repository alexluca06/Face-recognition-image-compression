%%% For explanations follow each steps from PDF %%%

function A_k = task1(image, k)
  
  %Pixels matrix reading
  A = double(imread(image));

  %Make the svd for the image
  [U S V] = svd(A);
 
  %Elimination of null singular values 
  S_new = S(1:k,1:k);
  V_new = V'(1:k,:);
  U_new = U(:,1:k);
 
  %Image compression
  A_k = U_new*S_new*V_new;

end