% Problem D.1 [1 Marks] Let A be a 5 × 4 matrix array with real-valued elements:
A = [0.5377  -1.3077  -1.3499  -0.2050;
     1.8339  -0.4336   0.3049  -0.1241;
    -2.2588   0.3426   0.7254   1.4897;
     0.8622   3.5784  -0.0631   1.4090;
     0.3188   2.7694   0.7147   1.4172];

% (a) A(:) - Returns all elements of matrix A as a single column vector
A_col_vector = A(:);
disp('Part (a): A(:)');
disp(A_col_vector);

% (b) A([2 4 7]) - Select the elements of A at indices 2, 4, and 7
A_selected_elements = A([2 4 7]);
disp('Part (b): A([2 4 7])');
disp(A_selected_elements);

% (c) A(A > 0.2) - Select all elements of A that are greater than 0.2
A_greater_than_02 = A(A > 0.2);
disp('Part (c): A(A > 0.2)');
disp(A_greater_than_02);

% (d) A(A >= 0.2) = 0 - Set all elements greater than 0.2 in A to zero
A(A >= 0.2) = 0;
disp('Part (d): A after setting elements greater than or equal to 0.2 to zero');
disp(A);

% (e) A([A >= 0.2]) = 0 - Reapply the condition
A([A >= 0.2]) = 0;
disp('Part (e): Reapply the condition A([A >= 0.2]) = 0');
disp(A);


