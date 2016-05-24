// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - Scilab Enterprises - Clément DAVID
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- XCOS TEST -->
//
// <-- Non-regression test for bug 7985 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=7985
//
// <-- Short Description -->
// dmmul.c define an unoptimized dgemm version

assert_checktrue(importXcosDiagram(SCI + "/modules/xcos/tests/nonreg_tests/bug_7985.zcos"));

xcos_simulate(scs_m, 4);
assert_checktrue(isdef("sim_in"));
assert_checktrue(isdef("sim_out"));

// Same filter as the diagram but in Scilab script
sl = syslin('c', -eye(3,3), eye(3,3), eye(3,3), zeros(3,3), zeros(3,1));
t = 0:0.1:9.9;
in = ones(100,1);
in = (in * [1 2 3])';
out = csim(in,t,sl);

// inputs should be the same
assert_checkalmostequal(sim_in.time, t');
assert_checkalmostequal(sim_in.values, in');

// outputs should be the same
assert_checkalmostequal(sim_out.time, t');
assert_checkalmostequal(sim_out.values, out', 0.0005);
