function solvers = getSolvers_2D3D()
% GETSOLVERS_2D2D Get an array of all upgrade solvers
%   solvers = GETSOLVERS_2D2D() gets an array of upgrade solvers that take a
%       minimal sample and returns the inverse transpose of L and q.
%
%       The name/id of the solver are, in order: 500, 410, 401, 320, 311,
%       221
%
%   See also createRandomSample.


    % These solvers do not require an action matrix solver.
    solvers(1).id = [5 0 0];
    solvers(1).solve = @upgrade500;

    for k=1:length(solvers)
        solvers(k).name = sprintf('%d%d%d',solvers(k).id);
    end
end

