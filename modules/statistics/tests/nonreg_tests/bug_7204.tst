// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Sylvestre Ledru
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 7204 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=7204
//
// <-- Short Description -->
//    geomean(v) applied to an hypermat v gives wrong result
// =============================================================================

v=rand(2,2,2);
a=geomean(v);
b=prod(v)^(1/8);
assert_checkalmostequal(a,b);
