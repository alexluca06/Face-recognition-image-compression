%%% For explanations follow each steps from PDF %%%

function [min_dist output_img_index] = face_recognition(image_path, m, A,
                                       eigenfaces, pr_img)
   %Read images for test functionality
   image_test = double(rgb2gray(imread(image_path)));
   [row column] = size(image_test);
   index = 1;
   %Step 6
    for i = 1 : row
      for j = 1 : column
        T(index, 1) = image_test(i,j);
        index = index + 1;
      end
    end
   
   %Step 7
   [row column] = size(T);
   PrTestImage = eigenfaces' * (T - m);
   %Step 8
   min_dist = norm(PrTestImage(:,1) - pr_img(:,1));
   output_img_index = 1;
   for index = 2 : 10
     if (norm(PrTestImage(:,1) - pr_img(:,index)) < min_dist)
       min_dist = norm(PrTestImage(:,1) - pr_img(:,index));
       output_img_index = --index;
     end
   end
end