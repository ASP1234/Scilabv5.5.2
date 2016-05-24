// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - DIGITEO - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
//
// <-- Non-regression test for bug 2479 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=2479
//
// <-- Short Description -->
// Graphic editor could not be used when format was not format("v",18).

format('e',10);
plot();
ged(8,0);
