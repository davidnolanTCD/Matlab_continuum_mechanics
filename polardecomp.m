function [U, R] = polardecomp(F)
%POLARDECOMP Compute the polar decomposition of the deformation gradient
%   [U, R] = POLARDECOMP(F) takes a deformation gradient F and performs the
%   standard polar decomposition of F in the material configuartion to
%   determine the right stretch tensor U and the rotation tensor R
%
C = F'*F; % right Cauchy Green Tensor
%
% Right stretch tensor
[Cvec, Cval] = eigs(C);
U = Cvec*sqrt(Cval)/Cvec;
%
% Rotation in undef config
R = F/U;