// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2005-2008 - INRIA - Pierre MARECHAL <pierre.marechal@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 1586 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=1586
//
// <-- Short Description -->
//    I have found a possible error in Scilab:
//    when I use the function 'mkdir'.
//    For example:
//
//    [status,msg]=mkdir('new_1')
//    msg  =
//
//    status  =
//        1.
//
//    (the result is OK.), but when I use it again (note that the
//    directory "new_1" already exists), then I obtain:
//
//    [status,msg]=mkdir('new_1')
//
//    msg=
//    Error : Directory or file D:\progs\scilab-3.1.1\contrib\lrp\example\
//          new_1 already exists.
//    status  =
//        0.
// ...

dirToSave = pwd();

cd(TMPDIR);
[status,msg]=mkdir('bug1586');
[status,msg]=mkdir('bug1586');

rmdir('bug1586');
cd(dirToSave);

if status <> 2 then pause,end
