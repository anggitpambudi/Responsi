clc;clear;%hapus

%Data Import
data=xlsread('Real estate valuation data set.xlsx','C2:E51');%mengambil data baris 1-50 kolom house age, distance to the nearest MRT station,
%number of convenience stores
harga = xlsread('Real estate valuation data set.xlsx','H2:H51'); %mengambil data baris 1-50 kolom house price of unit area.
raw=[data harga];

k=[1,0,1,0]; %0= cost,1 = benefit

w = [3,5,4,1];%bobot nilai

[m n]=size(raw);%inisialisasi ukuran x
w=w./sum(w);%membagi bobot per kriteria dengan jumlah total seluruh bobot

for j=1:n,
    if k(j)==0,
        w(j)=-1*w(j);
    end;
end;
for i=1:m,
    S(i)=prod(raw(i,:).^w);
end;
data= S/sum(S);
Descend=sort(data,'descend')%mengurutkan berdasarkan nilai terbesar
skor_tertinggi = max(data) 
