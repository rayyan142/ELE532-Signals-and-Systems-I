%D.3)
load('ELE532_Lab1_Data.mat');

y_audio = x_audio(:,:);
count = 0;
for m = 1:20000
    if y_audio(m)==0
        count = count +1;
    end
end
y_audio([abs(y_audio)<0.001]) = 0;
county = 0;
for m = 1:20000
    if y_audio(m) == 0
        county = county + 1;
    end
end
count %Zero values in original
county %Zero values in processed

