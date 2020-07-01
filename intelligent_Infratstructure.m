clc
clear all
close all
count=0;

%zone max dimensions
z_x=5;z_y=5;
N1=(z_x-1);N2=(z_y-1);

arr_x=[];
arr_y=[];

% PART 2: best LED

photo=[0 0 160	209	223	221	201
0 0 237	268	262	211	186
0 0 266	273	271	269	198
0 0 278	280	272	256	192
0 0 192	262	248	237	178];

kitchen=[0.5	0.5	0.5	0.5	0.5	0.5	0.5	0.5	0.5	0.5	0.5	0.5	0.5	0.5
0.5	0.5	0.5	0.5	0.5	0.5	0.5	0.5	0.5	0.5	0.5	0.5	0.5	0.5
0.5	0.5	4	0.5	0.5	0.5	0.5	0.5	4	0.5	0.5	0.5	0.5	0.5
0.5	0.5	4	3	3	3	3	3	6	2	1	1	0.5	0.5
0.5	0.5	1	0.5	0.5	0.5	0.5	0.5	4	3	3	3	0.5	0.5
0.5	0.5	1	0.5	0.5	0.5	0.5	0.5	3	1	1	0.5	0.5	0.5
0.5	0.5	3	2	2	2	2	2	3	1	1	0.5	0.5	0.5
0.5	0.5	3	0.5	0.5	0.5	0.5	0.5	2	1	1	0.5	0.5	0.5
0.5	0.5	4	1	1	1	1	1	2	3	4	4	0.5	0.5
0.5	0.5	4	0.5	0.5	0.5	0.5	0.5	0.5	0.5	0.5	0.5	0.5	0.5];


z_best=zeros(500,1);


%PART 1 : Exhaustive zones' arrangement finding

	for R1=1:7

		for C1=1:7

			for R2=(R1+1):(R1+8)

				for C2=1:7



						for C3=1:7

							for R4=1:7



									for R5=(R4+1):(R4+8)



													if(((R1-1)<=N1)&&((R2-(R1+1))<=N1)&&((14-(R2+1))<=N1)&&((R4-(1))<=N1)&&((R5-(R4+1))<=N1)&&((14-(R5+1))<=N1)&&((C1-(1))<=N2)&&((C2-(1))<=N2)&&((C3-(1))<=N2)&&((10-(C1+1))<=N2)&&((10-(C2+1))<=N2)&&((10-(C3+1))<=N2))
														count=count+1;
%

														fprintf("\nZones' Arrangement %d\n",count);
														r1=1;c1=1;r2=(R1+1);c2=1;r3=(R2+1);R3=14;c3=1;r4=1;c4=(C1+1);C4=10;r5=(R4+1);c5=(C2+1);C5=10;r6=(R5+1);R6=14;c6=(C3+1);C6=10;
%
%
%
                                                        fprintf("Region 1: rows' span:(%d, %d)  columns' span: (%d, %d)\n",r1,R1,c1,C1);
														fprintf("Region 2: rows' span:(%d, %d)  columns' span: (%d, %d)\n",r2,R2,c2,C2);
														fprintf("Region 3: rows' span:(%d, %d)  columns' span: (%d, %d)\n",r3,R3,c3,C3);
														fprintf("Region 4: rows' span:(%d, %d)  columns' span: (%d, %d)\n",r4,R4,c4,C4);
														fprintf("Region 5: rows' span:(%d, %d)  columns' span: (%d, %d)\n",r5,R5,c5,C5);
														fprintf("Region 6: rows' span:(%d, %d)  columns' span: (%d, %d)\n",r6,R6,c6,C6);
%Region 1
m=1;
n=1;

X1=zeros((C1-c1+1),(R1-r1+1));

for i=(11-C1):(11-c1)
    n=1;
    for j=r1:R1

        X1(m,n)=kitchen(i,j);
        n=n+1;
    end
    m=m+1;
end



fil2_1=filter2(photo,X1);

y1=max(max(fil2_1));

[idx1_1 idx2_1]=find(fil2_1==y1);

figure(count);
blah=sprintf("Kitchen\nZones' Arrangement %d",(count));
sgt=sgtitle(blah);
sgt.FontSize=15;

subplot(2,3,4)
surfl(fil2_1);
title('Region 1');
zlabel('Correlation matrix value');
xlabel('Local X','Rotation',15);
ylabel('Local Y','Rotation',-32);

%Region 2
m=1;
n=1;

X2=zeros((C2-c2+1),(R2-r2+1));

for i=(11-C2):(11-c2)
    n=1;
    for j=r2:R2

        X2(m,n)=kitchen(i,j);
        n=n+1;
    end
    m=m+1;
end



fil2_2=filter2(photo,X2);

y2=max(max(fil2_2));

[idx1_2 idx2_2]=find(fil2_2==y2);

subplot(2,3,5)
surfl(fil2_2);
title('Region 2');
zlabel('Correlation matrix value');
xlabel('Local X','Rotation',15);
ylabel('Local Y','Rotation',-32);


%Region 3
m=1;
n=1;

X3=zeros((C3-c3+1),(R3-r3+1));

for i=(11-C3):(11-c3)
    n=1;
    for j=r3:R3

        X3(m,n)=kitchen(i,j);
        n=n+1;
    end
    m=m+1;
end



fil2_3=filter2(photo,X3);

y3=max(max(fil2_3));

[idx1_3 idx2_3]=find(fil2_3==y3);

subplot(2,3,6)
surfl(fil2_3);
zlabel('Correlation matrix value');
xlabel('Local X','Rotation',15);
ylabel('Local Y','Rotation',-32);
title('Region 3');


%Region 4
m=1;
n=1;

X4=zeros((C4-c4+1),(R4-r4+1));

for i=(11-C4):(11-c4)
    n=1;
    for j=r4:R4

        X4(m,n)=kitchen(i,j);
        n=n+1;
    end
    m=m+1;
end



fil2_4=filter2(photo,X4);

y4=max(max(fil2_4));

[idx1_4 idx2_4]=find(fil2_4==y4);

subplot(2,3,1)
surfl(fil2_4);
title('Region 4');
zlabel('Correlation matrix value');
xlabel('Local X','Rotation',15);
ylabel('Local Y','Rotation',-32);

%Region 5
m=1;
n=1;

X5=zeros((C5-c5+1),(R5-r5+1));

for i=(11-C5):(11-c5)
    n=1;
    for j=r5:R5

        X5(m,n)=kitchen(i,j);
        n=n+1;
    end
    m=m+1;
end




fil2_5=filter2(photo,X5);

y5=max(max(fil2_5));

[idx1_5 idx2_5]=find(fil2_5==y5);

subplot(2,3,2)
surfl(fil2_5);
title('Region 5');
zlabel('Correlation matrix value');
xlabel('Local X','Rotation',15);
ylabel('Local Y','Rotation',-32);


%Region 6
m=1;
n=1;

X6=zeros((C6-c6+1),(R6-r6+1));

for i=(11-C6):(11-c6)
    n=1;
    for j=r6:R6

        X6(m,n)=kitchen(i,j);
        n=n+1;
    end
    m=m+1;
end



fil2_6=filter2(photo,X6);

y6=max(max(fil2_6));

subplot(2,3,3)
surfl(fil2_6);
title('Region 6');
zlabel('Correlation matrix value');
xlabel('Local X','Rotation',15);
ylabel('Local Y','Rotation',-32);

[idx1_6 idx2_6]=find(fil2_6==y6);
z_best(count)=(y1+y2+y3+y4+y5+y6);

 idx_y=[idx1_1 idx1_2 idx1_3  idx1_4 idx1_5 idx1_6];
 idx_x=[idx2_1 idx2_2 idx2_3  idx2_4 idx2_5 idx2_6];

 arr_x=[arr_x;idx_x];
 arr_y=[arr_y;idx_y];








                                                    end




													 end
												 end
											end
										end
									end
								end
    end


    best_z=max(z_best);
    idx_z=[];
idx_z=[idx_z;(find(z_best==best_z))];
[cnt1,cnt2]=size(idx_z);
cnt1;
cnt2;

fprintf("\n\nRoom: Kitchen\n");


for i=1:cnt1
    for j=1:cnt2
        fprintf("\nBest arrangement of zones is achieved in Zones' Arrangement %d\n",(idx_z(i,j)));

 fprintf("The local coordinates in  region1 for best LED position in Zones' Arrangement %d is (%d,%d)\n",(idx_z(i,j)),(arr_x((idx_z(i,j)),1)),(arr_y((idx_z(i,j)),1)));
 fprintf("The local coordinates in  region2 for best LED position in Zones' Arrangement %d is (%d,%d)\n",(idx_z(i,j)),(arr_x((idx_z(i,j)),2)),(arr_y((idx_z(i,j)),2)));
 fprintf("The local coordinates in  region3 for best LED position in Zones' Arrangement %d is (%d,%d)\n",(idx_z(i,j)),(arr_x((idx_z(i,j)),3)),(arr_y((idx_z(i,j)),3)));
 fprintf("The local coordinates in  region4 for best LED position in Zones' Arrangement %d is (%d,%d)\n",(idx_z(i,j)),(arr_x((idx_z(i,j)),4)),(arr_y((idx_z(i,j)),4)));
 fprintf("The local coordinates in  region5 for best LED position in Zones' Arrangement %d is (%d,%d)\n",(idx_z(i,j)),(arr_x((idx_z(i,j)),5)),(arr_y((idx_z(i,j)),5)));
 fprintf("The local coordinates in  region6 for best LED position in Zones' Arrangement %d is (%d,%d)\n",(idx_z(i,j)),(arr_x((idx_z(i,j)),6)),(arr_y((idx_z(i,j)),6)));

    end
end