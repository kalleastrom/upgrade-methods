function [Hqp,Hqh] = findLinearConstraints_2D(sample)
% FINDLINEARCONSTRAINTS_2D Find the linear constraints on H = inv(L'*L) and q
%   [Hqp,Hqh] = FINDLINEARCONSTRAINTS_2D(sample) finds the linear constraints
%       on H and q given a sample. Hqp is a 9 vector and Hqh is a 9 x k
%       matrix where k is the dimension of the kernel of the linear
%       equations, i.e., the number of nonlinear equations required to
%       solve the minimal problem. For some k vector x we get
%
%           Hq = Hqp+Hqh*x;
%           H = Hq([1 3; 3 2]);
%           q(:,i) = Hq([4; 5]);
%
% See also createRandomSample.

    U = sample.U;
    b = sample.b;
    c = sample.c;

    % Find linear requirements on H and q, b-c = Cr'*diag(U'*H*U)-2*U'*q.
    indsI = [1 2 1];
    indsJ = [1 2 2];
    mult = [1 1 2]; % Due to symmetry in H.

    UtU = mult.*U(indsI,:)'.*U(indsJ,:)';
    AA = [UtU -2*U'];
    bb = b-c;

    % TODO: It might be a good idea to remove some columns of from AA and
    % set some elements in Hqp to zero.
    Hqp = AA\bb;
    
    if sample.id(1) < 5
        [~,~,v] = svd(AA);
        Hqh = v(:,sample.id(1)+1:5);
    else
        Hqh = [];
    end
end

