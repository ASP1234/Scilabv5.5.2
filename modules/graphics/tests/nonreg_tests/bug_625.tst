// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) ????-2008 - INRIA
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 625 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=625
//
// <-- Short Description -->
//    xget does not recognise (anymore) some of its valid keys.
//    Side effect: getmark() is very verbose and does not show
//    scaled marks.

if execstr("xget(''mark size'')","errcatch")<>0 then pause,end
