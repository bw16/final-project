
I1='D:\TTNCONTROL.tif';
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
img_thre=img_bgsub>0.2;
D=bwdist(~img_thre);
D=-D;
D(~img_thre)=-Inf;
L=watershed(D);
L(~img_thre)=0;
rgb=label2rgb(L,'jet',[.5 .5 .5]);
 
        writeVideo(V,rgb);
    end 
    
    
     %img_thre_a=im2double(img_thre);
        %imgfile1=cat(3,imadjust(img_thre_a),img_thre,zeros(size(img_thre)));
        %imgfile1_double=im2double(imgfile1);
        %writeVideo(V,imgfile1_double);
            %img_thre=img_bgsub>0.2;
                   %img_thre_a=im2double(img_thre);
        %imgfile1=cat(3,imadjust(img_thre_a),img_thre,zeros(size(img_thre)));
        %imgfile1_double=im2double(imgfile1);
        %writeVideo(V,imgfile1_double);
            for z=2:nz
   close(V)