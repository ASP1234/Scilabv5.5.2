// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA -
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// =============================================================================
// Unitary tests for isdir function
// =============================================================================

if isdir(SCIHOME) <> %t then pause,end
if isdir(SCI) <> %t then pause,end

if isdir(SCIHOME+filesep()) <> %t then pause,end
if isdir(SCI+filesep()) <> %t then pause,end

if isdir('A_NAME_OF_DIRECTORY') <> %f then pause,end

DIR_NAME_TST = TMPDIR+filesep()+'MY_TMPDIR_DIR';
if mkdir(DIR_NAME_TST) <> 1 then pause,end
if isdir(DIR_NAME_TST) <> %t then pause,end
if isdir(DIR_NAME_TST+filesep()) <> %t then pause,end
if removedir(DIR_NAME_TST) <> %t then pause,end
