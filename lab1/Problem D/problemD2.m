% Problem D.2 [1 Mark]

B = rand(1024, 100);

% Part (a): Using nested for loops to set B(i,j) to 0 if B(i,j) < 0.01
B_loop = B;
tic;
for i = 1:size(B, 1)
    for j = 1:size(B, 2)
        if B_loop(i, j) < 0.01
            B_loop(i, j) = 0;
        end
    end
end
toc;
disp('Part (a):');

% Part (b): Using MATLAB indexing to set B(i,j) to 0 if B(i,j) < 0.01
B_indexed = B;
tic;
B_indexed(B < 0.01) = 0;
toc;
disp('Part (b):');
