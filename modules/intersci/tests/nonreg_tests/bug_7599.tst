// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 7599 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=7599
//
// <-- Short Description -->
// Intersci-n and intersci did not create code from a .desc file if it was not ended by an empty line.
//

if getos() == 'Windows' then
  copyfile(SCI+"/modules/intersci/tests/nonreg_tests/bug_7599.desc", TMPDIR+"/bug_7599.desc");
  cd(TMPDIR);
  s = dos(SCI+'/modules/intersci/bin/intersci-n.exe bug_7599');
  if s <> %t then pause, end
  r = mgetl(TMPDIR + '/bug_7599.c');
  ref = mgetl(SCI+"/modules/intersci/tests/nonreg_tests/bug_7599.c");
  if ~and(r == ref) then pause, end
end
