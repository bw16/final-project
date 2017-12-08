function centerimg(I1)
reader1=bfGetReader(I1);
z=reader1.getSizeZ;
t=reader1.getSizeT;
Ind1=reader1.getIndex(z-1,0,t-1)+1;
imgnow1=bfGetPlane(reader1,Ind1);
img_double=im2double(imgnow1);
img_dilate=imdilate(img_double,strel('disk',8));
img_filter=imfilter(img_dilate,fspecial('gaussian',4,2));
img_bg=imopen(img_filter,strel('disk',100));
img_bgsub=imsubtract(img_filter,img_bg);
img_thre=img_bgsub>0.15;
img_thre_a=im2double(img_thre);
imgfile1=cat(3,imadjust(img_thre_a),img_thre,zeros(size(img_thre)));        
imgfile1_double=im2double(imgfile1);
edge_img = edge(img_thre, 'canny');
[centers,radii]=imfindcircles(edge_img,[15 25],'Sensitivity',0.91);
imshow(imgnow1,[]);
centers;
hold on;
for ii=1:length(centers)
    drawcircle(centers(ii,:),radii(ii),'m');
end
        