// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Pierre MARECHAL <pierre .marechal@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 2674 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=2674
//
// <-- Short Description -->
// regexp function return weird strings.
//

[ start_ind end_ind str_match ] = regexp('XABYABBBZ','/ab*/i');
if str_match <> ["AB";"ABBB"] then pause,end
