function [Lti,q] = upgrade500(sample,~)
% UPGRADE500 Solve a low-rank affine upgrade problem (dimension 2)
%   [Lti,q] = UPGRADE500(sample,opts) finds the affine upgrade L and q
%       given a minimal sample with id 500. This solver is linear. Note
%       that Lti = inv(L').
%
% See also upgradeGeneral, upgrade810, upgrade801.

    Hq = findLinearConstraints_2D(sample);
    
    H = Hq([1 3; 3 2]);
    q = Hq([4; 5]);

    try
        Lti{1} = chol(H);
    catch
        Lti = {};
        q = [];
    end
end

