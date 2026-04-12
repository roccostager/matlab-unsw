% Function takes TWO MATRICES of parametric vector form coeffecients
% Matrix columns: col1=point, col2=param1 coef, col3=param2 coef
% Note: assumes planes are not parallel, works in the context of question

function [] = planeintersection(P1, P2)

    % Check valid input: P1 and P2 must be 3x3 matrices
    arguments
        P1 (3,3) double
        P2 (3,3) double
    end

% Equate the right hand sides of the parametric forms of these planes to
% obtain a system of 3 linear equations for lambda1, lambda2, mu1, mu2.

    % Extract coeffiecients (consider way input params were defined)
    a = P1(:, 1); lb1 = P1(:, 2); lb2 = P1(:, 3);
    b = P2(:, 1); mu1 = P2(:, 2) ;mu2 = P2(:, 3);

% Enter an augmented matrix for this linear system in Matlab and use rref
% to find the row echelon form of this matrix.

    % Consider previously: a + lamdba1 + lamdba2 = b + mu1 + mu2
    % Rearrange such that lamdba1 + lambda2 - mu1 - mu2 = b - a

    A = [lb1, lb2, -mu1, -mu2];
    B = b - a;

    Aug = [A B];  % Defining the augmented matrix

% Using the RREF matrix, find the general solution for lambda1, lambda2,
% mu1, mu2 and hence a parametric form for the intersection of the planes
% Pi1 and Pi2.

    R = rref(Aug);

    % Now we substitute these solutions for lambda1 and lambda2 into P1
    % L = a + (R(1,5) - \mu2*R(1,4))*lb1 + (R(2,5) - \mu2*R(2,4))*lb2
    % Remember: col5 is a number, col4 is a coefficient of mu2

    % Substitue solutions for lambda1, lambda2 into parametric lines
    p = a + R(1, 5).*lb1 + R(2, 5).*lb2;  % Point vector
    d = -R(1, 4).* lb1 - R(2, 4).*lb2;  % Direction vector (parameter mu2)

    % Display solution
    fprintf("Point: [%f; %f; %f]\n", p);
    fprintf("Direction: [%f; %f; %f]\n", d);

end