// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 - DIGITEO
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- JVM MANDATORY -->

chdir(TMPDIR);

exec(SCI+"/modules/localization/tests/unit_tests/CreateDir.sce", -1);


tab_ref = [
"世界您好",
"азеазея",
"ハロー・ワールド",
"เฮลโลเวิลด์",
"حريات وحقوق",
"프로그램",
"프로그램",
"תוכנית"];

sleep(2);

if(fileinfo("test_time") <> [])
	deletefile("test_time");
end

f = mopen("test_time", "w");
mclose(f);

ref = 0;
FileNameList = ["test_time"];
for i = 1 : size(tab_ref,'*')
	FileNameList(i+1) = "dir_" + tab_ref(i) + filesep() + "file_" + tab_ref(i);
end

a = newest(FileNameList);
if(a <> 1) then 
	pause
end

a=dir('SCI\bin');
f1=a(2);
r1=newest(f1);
clear a f1 r1

realtimeinit(2);
realtime(0);

tab_ref = [
"世界您好",
"азеазея",
"ハロー・ワールド",
"حريات وحقوق",
"תוכנית"];


for k=1 : size(tab_ref,"*")
	realtime(k);
	mputl("",TMPDIR+"/newest_"+tab_ref(k));
end

if newest([]) <> [] then pause,end
if newest()   <> [] then pause,end

if newest("SCI/etc/scilab.start") <> 1 then pause,end
if newest("SCI/nofile.txt")       <> 1 then pause,end

for i = 1 : size(tab_ref,"*")
	for j = size(tab_ref,"*") : -1 : 1
		if(i <> j) then
			ref = max(i,j);
			if(ref == i) then
				ref = 1;
			else;
				ref = 2;
			end
			if(newest(TMPDIR+"/newest_"+tab_ref(i), TMPDIR+"/newest_"+tab_ref(j)) <> ref) then pause, end
			if(newest([TMPDIR+"/newest_"+tab_ref(i), TMPDIR+"/newest_"+tab_ref(j)]) <> ref)  then pause, end
			if(newest([TMPDIR+"/newest_"+tab_ref(i); TMPDIR+"/newest_"+tab_ref(j)]) <> ref)  then pause, end
			if(newest(TMPDIR+"/newest_"+tab_ref(i), TMPDIR+"/no_file") <> 1)  then pause, end
			if(newest([TMPDIR+"/newest_"+tab_ref(i), TMPDIR+"/no_file"]) <> 1)  then pause, end
			if(newest([TMPDIR+"/newest_"+tab_ref(i); TMPDIR+"/no_file"]) <> 1)  then pause, end
		end
	end
end
