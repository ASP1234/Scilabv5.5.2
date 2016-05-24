% Test file for function acosh()
% Matlab version: 7.9.0.529 (R2009b)

% TEST 1
res1 = acosh([]);
% TEST 2
res2 = acosh(m2sciUnknownType([]));
% TEST 3
res3 = acosh(m2sciUnknownDims([]));
% TEST 4
res4 = acosh([1]);
% TEST 5
res5 = acosh([1,2,3]);
% TEST 6
res6 = acosh([1;2;3]);
% TEST 7
res7 = acosh([1,2,3;4,5,6]);
% TEST 8
res8 = acosh(m2sciUnknownType([1]));
% TEST 9
res9 = acosh(m2sciUnknownType([1,2,3]));
% TEST 10
res10 = acosh(m2sciUnknownType([1;2;3]));
% TEST 11
res11 = acosh(m2sciUnknownType([1,2,3;4,5,6]));
% TEST 12
res12 = acosh(m2sciUnknownDims([1]));
% TEST 13
res13 = acosh(m2sciUnknownDims([1,2,3]));
% TEST 14
res14 = acosh(m2sciUnknownDims([1;2;3]));
% TEST 15
res15 = acosh(m2sciUnknownDims([1,2,3;4,5,6]));
% TEST 16
res16 = acosh([i]);
% TEST 17
res17 = acosh([i,2i,3i]);
% TEST 18
res18 = acosh([i;2i;3i]);
% TEST 19
res19 = acosh([i,2i,3i;4i,5i,6i]);
% TEST 20
res20 = acosh(m2sciUnknownType([i]));
% TEST 21
res21 = acosh(m2sciUnknownType([i,2i,3i]));
% TEST 22
res22 = acosh(m2sciUnknownType([i;2i;3i]));
% TEST 23
res23 = acosh(m2sciUnknownType([i,2i,3i;4i,5i,6i]));
% TEST 24
res24 = acosh(m2sciUnknownDims([i]));
% TEST 25
res25 = acosh(m2sciUnknownDims([i,2i,3i]));
% TEST 26
res26 = acosh(m2sciUnknownDims([i;2i;3i]));
% TEST 27
res27 = acosh(m2sciUnknownDims([i,2i,3i;4i,5i,6i]));
