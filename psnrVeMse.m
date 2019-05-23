 resim=imread('C:\Users\ben burak\Desktop\uws0150 (2).JPG');
 griResim=rgb2gray(resim);
 J = histeq(griResim);

 
% int64 kullanmam�z�n sebebi resimler uint8 veri tipinde oldu�undan max 255
% de�erini alabiliyorlar biz daha b�y�k say�larla oynuyaca��m�zdan bu
% d�n���m yap�ld�

% Ayr�ca sonuc de�eri double'a cast edildi aksi halde en yak�n tam say�ya
% yuvarlama yap�yordu ve do�ru sonu� �retmiyordu.
 

% % % % % % % % % % % MSE DE�ER� HESAPLAMA % % % % % % % % % % 
sonuc=0;
for i=1:size(resim,1)
    for j=1:size(resim,2)
        temp=int64(J(i,j))-int64(griResim(i,j));
        temp=temp*temp;
        sonuc=sonuc+temp;
        
    end
end

fprintf('Sonuc degeri: %d\n',sonuc);

boyut=size(resim,1)*size(resim,2);

dSonuc=cast(sonuc,'double');
mse=dSonuc/boyut;

fprintf('MSE degeri: %f\n',mse);


% % % % % % % % % % PSNR DE�ER� HESAPLAMA % % % % % % % % % %     

maxDeger=255;

maxDeger=maxDeger*maxDeger;
tut=maxDeger/mse;

psnr=10*log10(tut);

fprintf('PSNR degeri: %f\n',psnr);






