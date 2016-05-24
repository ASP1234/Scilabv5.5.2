//======================================================================================== 
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2007-2008 - INRIA
//
//  This file is distributed under the same license as the Scilab package.
//======================================================================================== 

// <-- CLI SHELL MODE -->

//======================================================================================== 
// unit tests strsubst
//======================================================================================== 
if strsubst('abc,abd,aa,bxe',',',';')<>'abc;abd;aa;bxe'  then pause,end
//======================================================================================== 
if strsubst('abc,abd,aa,bxe',',',emptystr())<>'abcabdaabxe'  then pause,end
//======================================================================================== 
if strsubst(',abc,abd,aa,bxe',',',emptystr())<>'abcabdaabxe'  then pause,end
//======================================================================================== 
if strsubst('abc',',',';')<>'abc'  then pause,end
//======================================================================================== 
if strsubst('SCI/demos/scicos','SCI','.') <> './demos/scicos'  then pause,end
//======================================================================================== 
if strsubst('SCI/demos/scicos','/',' ') <> 'SCI demos scicos'  then pause,end
//======================================================================================== 
if strsubst([],'/',' ') <> [] then pause,end
//======================================================================================== 
if strsubst([],' ','') <> [] then pause,end
//======================================================================================== 
if strsubst('',' ','') <> '' then pause,end
//======================================================================================== 
if strsubst("2","3","1") <> "2" then pause,end
//======================================================================================== 
if strsubst(["2","3"],"3","1") <> ['2' '1'] then pause,end
//======================================================================================== 
r = strsubst(['Scilab','Mathlab';'Octlab','Rlab'],'lab','');
ref  = ['Sci','Math';'Oct','R'];
if (r <> ref) then  pause,end
//======================================================================================== 
if strsubst('xbc','/abc/',' ','r') <>  'xbc'   then pause,end
if strsubst('axc','/abc/',' ','r') <>  'axc'   then pause,end
if strsubst('xaccy','/abc/',' ','r') <>  'xaccy'   then pause,end
if strsubst('abc','/ab*c/',' ','r') <>  ' '   then pause,end
if strsubst('abc','/ab*bc/',' ','r') <>  ' '   then pause,end
if strsubst('abbc','/ab*bc/',' ','r') <>  ' '   then pause,end
if strsubst('abbbbc','/ab*bc/',' ','r') <>  ' '   then pause,end
if strsubst('abbbbc','/.{1}/',' ','r') <>  ' bbbbc'   then pause,end
if strsubst('abbbbc','/.{3,4}/',' ','r') <>  ' bc'   then pause,end
if strsubst('abbbbc','/ab{0,}bc/','^','r') <>  '^'   then pause,end
if strsubst('abbc','/ab+bc/','^','r') <>  '^'   then pause,end
if strsubst('abc','/ab+bc/','^','r') <>  'abc'   then pause,end
if strsubst('abq','/ab+bc/','^','r') <>  'abq'   then pause,end
if strsubst('abbc','/ab{1,}bc/','^','r') <>  '^'   then pause,end
if strsubst('abbbbc','/ab+bc/','^','r') <>  '^'   then pause,end
if strsubst('abbbbc','/ab{1,}bc/','^','r') <>  '^'   then pause,end
if strsubst('abbc','/ab{1,3}bc/','^','r') <>  '^'   then pause,end
if strsubst('abbbbc','/ab{3,4}bc/','^','r') <>  '^'   then pause,end
if strsubst('abbbbc','/ab{4,5}bc/','^','r') <>  'abbbbc'   then pause,end
if strsubst('abbc','/ab?bc/',' ','r') <>  ' '   then pause,end
if strsubst('abc','/ab?bc/',' ','r') <>  ' '   then pause,end
if strsubst('abc','/ab{0,1}bc/',' ','r') <>  ' '   then pause,end
if strsubst('xaccy','/ab?bc/',' ','r') <>  'xaccy'   then pause,end
if strsubst('abc','/ab?c/',' ','r') <>  ' '   then pause,end
if strsubst('abc','/ab{0,1}c/',' ','r') <>  ' '   then pause,end
if strsubst('abbc','/ab*bc/',' ','r') <>  ' '   then pause,end
if strsubst('abc','/^abc$/',' ','r') <>  ' '   then pause,end
if strsubst('abcc','/^abc$/',' ','r') <>  'abcc'   then pause,end
if strsubst('aabc','/^abc&/',' ','r') <>  'aabc'   then pause,end
if strsubst('abbbbc','/ab{0,}bc/','^','r') <>  '^'   then pause,end
if strsubst('aabc','/abc$/','^','r') <>  'a^'   then pause,end
if strsubst('abc','/ab+bc/','^','r') <>  'abc'   then pause,end
if strsubst('abq','/ab+bc/','^','r') <>  'abq'   then pause,end
if strsubst('abbc','/ab{1,}bc/','^','r') <>  '^'   then pause,end
if strsubst('abbbbc','/ab+bc/','^','r') <>  '^'   then pause,end
if strsubst('abbbbc','/ab{1,}bc/','^','r') <>  '^'   then pause,end
if strsubst('xy','/\By\b/','^','r') <>  'x^'   then pause,end
if strsubst('xy','/\By\b/','^','r') <>  'x^'   then pause,end
if strsubst('yz','/\by\B/','^','r') <>  '^z'   then pause,end
if strsubst('e','/a|b|c|d|e/',' ','r') <>  ' '   then pause,end
if strsubst('abcdefg','/abcd*efg/',' ','r') <>  ' '   then pause,end
if strsubst('xaccy','/abc/',' ','r') <>  'xaccy'   then pause,end
if strsubst('xabyabbbz','/ab*/',' ','r') <>  'x yabbbz'   then pause,end
if strsubst('hij','/[abhgefdc]ij/',' ','r') <>  ' '   then pause,end
if strsubst('abcde','/^(ab|cd)e/',' ','r') <>  'abcde'   then pause,end
if strsubst('abbbbc','/ab*bc/',' ','r') <>  ' '   then pause,end
if strsubst('abbbbc','/.{1}/',' ','r') <>  ' bbbbc'   then pause,end
if strsubst('abbbbc','/.{3,4}/',' ','r') <>  ' bc'   then pause,end
if strsubst('effg','/(bc+d$|ef*g.|h?i(j|k))/','^','r') <>  'effg'   then pause,end
if strsubst('aa','/((((((((((a))))))))))\10/','^','r') <>  '^'   then pause,end
if strsubst('a!','/((((((((((a))))))))))\041/','^','r') <>  '^'   then pause,end
if strsubst('a','/(((((((((a)))))))))/','^','r') <>  '^'   then pause,end
if strsubst('multiple words, yeah','/multiple words/','^','r') <>  '^, yeah'   then pause,end
if strsubst('ac','/a[-]?c/','^','r') <>  '^'   then pause,end
if strsubst('a','/(a)|\1/','^','r') <>  '^'   then pause,end
if strsubst('A-','/a[-b]/i','^','r') <>  '^'   then pause,end
if strsubst('A-','/a[b-]/i','^','r') <>  '^'   then pause,end
if strsubst('A]','/a]/i','^','r') <>  '^'   then pause,end
if strsubst('abbc','/ab?bc/',' ','r') <>  ' '   then pause,end
if strsubst('abc','/ab?bc/',' ','r') <>  ' '   then pause,end
if strsubst('abc','/ab{0,1}bc/',' ','r') <>  ' '   then pause,end
if strsubst('xaccy','/ab?bc/',' ','r') <>  'xaccy'   then pause,end
if strsubst('abc','/ab?c/',' ','r') <>  ' '   then pause,end
if strsubst('abc','/ab{0,1}c/',' ','r') <>  ' '   then pause,end
if strsubst('abbc','/ab*bc/',' ','r') <>  ' '   then pause,end
if strsubst('abc','/^abc$/',' ','r') <>  ' '   then pause,end
if strsubst('abcc','/^abc$/',' ','r') <>  'abcc'   then pause,end
if strsubst('aabc','/^abc&/',' ','r') <>  'aabc'   then pause,end
if strsubst('abbbbc','/ab{0,}bc/','^','r') <>  '^'   then pause,end
if strsubst('aabc','/abc$/','^','r') <>  'a^'   then pause,end
if strsubst('abc','/ab+bc/','^','r') <>  'abc'   then pause,end
if strsubst('abq','/ab+bc/','^','r') <>  'abq'   then pause,end
if strsubst('abbc','/ab{1,}bc/','^','r') <>  '^'   then pause,end
if strsubst('abbbbc','/ab+bc/','^','r') <>  '^'   then pause,end
if strsubst('abbbbc','/ab{1,}bc/','^','r') <>  '^'   then pause,end
if strsubst('xy','/\By\b/','^','r') <>  'x^'   then pause,end
if strsubst('xy','/\By\b/','^','r') <>  'x^'   then pause,end
if strsubst('yz','/\by\B/','^','r') <>  '^z'   then pause,end
if strsubst('e','/a|b|c|d|e/',' ','r') <>  ' '   then pause,end
if strsubst('abcdefg','/abcd*efg/',' ','r') <>  ' '   then pause,end
if strsubst('xaccy','/abc/',' ','r') <>  'xaccy'   then pause,end
if strsubst('xabyabbbz','/ab*/',' ','r') <>  'x yabbbz'   then pause,end
if strsubst('hij','/[abhgefdc]ij/',' ','r') <>  ' '   then pause,end
if strsubst('abcde','/^(ab|cd)e/',' ','r') <>  'abcde'   then pause,end
if strsubst('abbbbc','/ab*bc/',' ','r') <>  ' '   then pause,end
if strsubst('abbbbc','/.{1}/',' ','r') <>  ' bbbbc'   then pause,end
if strsubst('abbbbc','/.{3,4}/',' ','r') <>  ' bc'   then pause,end
if strsubst('effg','/(bc+d$|ef*g.|h?i(j|k))/','^','r') <>  'effg'   then pause,end
if strsubst('aa','/((((((((((a))))))))))\10/','^','r') <>  '^'   then pause,end
if strsubst('a!','/((((((((((a))))))))))\041/','^','r') <>  '^'   then pause,end
if strsubst('a','/(((((((((a)))))))))/','^','r') <>  '^'   then pause,end
if strsubst('multiple words, yeah','/multiple words/','^','r') <>  '^, yeah'   then pause,end
if strsubst('ac','/a[-]?c/','^','r') <>  '^'   then pause,end
if strsubst('a','/(a)|\1/','^','r') <>  '^'   then pause,end
if strsubst('A-','/a[-b]/i','^','r') <>  '^'   then pause,end
if strsubst('A-','/a[b-]/i','^','r') <>  '^'   then pause,end
if strsubst('A]','/a]/i','^','r') <>  '^'   then pause,end
if strsubst('abbc','/ab?bc/',' ','r') <>  ' '   then pause,end
if strsubst('abc','/ab?bc/',' ','r') <>  ' '   then pause,end
if strsubst('abc','/ab{0,1}bc/',' ','r') <>  ' '   then pause,end
if strsubst('xaccy','/ab?bc/',' ','r') <>  'xaccy'   then pause,end
if strsubst('abc','/ab?c/',' ','r') <>  ' '   then pause,end
if strsubst('abc','/ab{0,1}c/',' ','r') <>  ' '   then pause,end
if strsubst('abbc','/ab*bc/',' ','r') <>  ' '   then pause,end
if strsubst('abc','/^abc$/',' ','r') <>  ' '   then pause,end
if strsubst('abcc','/^abc$/',' ','r') <>  'abcc'   then pause,end
if strsubst('aabc','/^abc&/',' ','r') <>  'aabc'   then pause,end
if strsubst('abbbbc','/ab{0,}bc/','^','r') <>  '^'   then pause,end
if strsubst('aabc','/abc$/','^','r') <>  'a^'   then pause,end
if strsubst('abc','/ab+bc/','^','r') <>  'abc'   then pause,end
if strsubst('abq','/ab+bc/','^','r') <>  'abq'   then pause,end
if strsubst('abbc','/ab{1,}bc/','^','r') <>  '^'   then pause,end
if strsubst('abbbbc','/ab+bc/','^','r') <>  '^'   then pause,end
if strsubst('abbbbc','/ab{1,}bc/','^','r') <>  '^'   then pause,end
if strsubst('xy','/\By\b/','^','r') <>  'x^'   then pause,end
if strsubst('xy','/\By\b/','^','r') <>  'x^'   then pause,end
if strsubst('yz','/\by\B/','^','r') <>  '^z'   then pause,end
if strsubst('e','/a|b|c|d|e/',' ','r') <>  ' '   then pause,end
if strsubst('abcdefg','/abcd*efg/',' ','r') <>  ' '   then pause,end
if strsubst('xaccy','/abc/',' ','r') <>  'xaccy'   then pause,end
if strsubst('xabyabbbz','/ab*/',' ','r') <>  'x yabbbz'   then pause,end
if strsubst('hij','/[abhgefdc]ij/',' ','r') <>  ' '   then pause,end
if strsubst('abcde','/^(ab|cd)e/',' ','r') <>  'abcde'   then pause,end
if strsubst('abbbbc','/ab*bc/',' ','r') <>  ' '   then pause,end
if strsubst('abbbbc','/.{1}/',' ','r') <>  ' bbbbc'   then pause,end
if strsubst('abbbbc','/.{3,4}/',' ','r') <>  ' bc'   then pause,end
if strsubst('effg','/(bc+d$|ef*g.|h?i(j|k))/','^','r') <>  'effg'   then pause,end
if strsubst('aa','/((((((((((a))))))))))\10/','^','r') <>  '^'   then pause,end
if strsubst('a!','/((((((((((a))))))))))\041/','^','r') <>  '^'   then pause,end
if strsubst('a','/(((((((((a)))))))))/','^','r') <>  '^'   then pause,end
if strsubst('multiple words, yeah','/multiple words/','^','r') <>  '^, yeah'   then pause,end
if strsubst('ac','/a[-]?c/','^','r') <>  '^'   then pause,end
if strsubst('a','/(a)|\1/','^','r') <>  '^'   then pause,end
if strsubst('A-','/a[-b]/i','^','r') <>  '^'   then pause,end
if strsubst('A-','/a[b-]/i','^','r') <>  '^'   then pause,end
if strsubst('A]','/a]/i','^','r') <>  '^'   then pause,end
if strsubst('abc','/abc/',' ','r') <>  ' '   then pause,end
//======================================================================================== 
if strsubst('......abef','/.*a(?!(b|cd)*e).*f/'                 ,' ' ,'r') <>  '......abef'  then pause,end
if strsubst('fools','/(foo|fool|x.|money|parted)$/'        ,' ' ,'r') <>  'fools'  then pause,end
if strsubst('fools','/(x.|foo|fool|x.|money|parted|y.)$/'  ,' ' ,'r') <>  'fools'  then pause,end
if strsubst('fools','/(foo|fool|money|parted)$/'           ,' ' ,'r') <>  'fools'  then pause,end
if strsubst('Oo','/^(o)(?!.*\1)/i'                      ,' ' ,'r') <>  'Oo'  then pause,end
if strsubst('AbCd','/ab(?i)cd/'                           ,' ' ,'r') <>  'AbCd'  then pause,end
if strsubst('a\nb\n','/a\Z/'                                ,' ' ,'r') <> 'a\nb\n'  then pause,end
if strsubst('a\nb\n','/a\z/'                                ,' ' ,'r') <> 'a\nb\n'  then pause,end
if strsubst('a\nb\n','/a$/'                                 ,' ' ,'r') <>  'a\nb\n' then pause,end
if strsubst('b\na\n','/a\z/'                                ,' ' ,'r') <>  'b\na\n'  then pause,end
if strsubst('a\nb\n','/a\Z/m'                               ,' ' ,'r') <>  'a\nb\n'  then pause,end
if strsubst('a\nb\n','/a\z/m'                               ,' ' ,'r') <> 'a\nb\n'  then pause,end
if strsubst('b\na\n','/a\z/m'                               ,' ' ,'r') <>  'b\na\n'  then pause,end
if strsubst('aa\nb\n','/aa\Z/'                               ,' ' ,'r') <>  'aa\nb\n' then pause,end
if strsubst('aa\nb\n','/aa\z/'                               ,' ' ,'r') <>  'aa\nb\n'  then pause,end
if strsubst('aa\nb\n','/aa$/'                                ,' ' ,'r') <>  'aa\nb\n'  then pause,end
if strsubst('b\naa\n','/aa\z/'                               ,' ' ,'r') <>  'b\naa\n'  then pause,end
if strsubst('aa\nb\n','/aa\Z/m'                              ,' ' ,'r') <>  'aa\nb\n'  then pause,end
if strsubst('aa\nb\n','/aa\z/m'                              ,' ' ,'r') <>  'aa\nb\n'  then pause,end
if strsubst('b\naa\n','/aa\z/m'                              ,' ' ,'r') <>  'b\naa\n'  then pause,end
if strsubst('ac\nb\n','/aa\Z/'                               ,' ' ,'r') <>  'ac\nb\n'  then pause,end
if strsubst('ac\nb\n','/aa\z/'                               ,' ' ,'r') <>  'ac\nb\n'  then pause,end
if strsubst('ac\nb\n','/aa$/'                                ,' ' ,'r') <>  'ac\nb\n'  then pause,end
if strsubst('b\nac\n','/aa\Z/'                               ,' ' ,'r') <>  'b\nac\n'  then pause,end
if strsubst('b\nac\n','/aa\z/'                               ,' ' ,'r') <>  'b\nac\n'  then pause,end
if strsubst('b\nac\n','/aa$/'                                ,' ' ,'r') <>  'b\nac\n'  then pause,end
if strsubst('b\nac'  ,'/aa\Z/'                               ,' ' ,'r') <>  'b\nac'  then pause,end
if strsubst('b\nac'  ,'/aa\z/'                               ,' ' ,'r') <>  'b\nac'  then pause,end
if strsubst('b\nac'  ,'/aa$/'                                ,' ' ,'r') <>  'b\nac'  then pause,end
if strsubst('ac\nb\n','/aa\Z/m'                              ,' ' ,'r') <>  'ac\nb\n'  then pause,end
if strsubst('ac\nb\n','/aa\z/m'                              ,' ' ,'r') <>  'ac\nb\n'  then pause,end
if strsubst('ac\nb\n','/aa$/m'                               ,' ' ,'r') <>  'ac\nb\n'  then pause,end
if strsubst('b\nac\n','/aa\Z/m'                              ,' ' ,'r') <>  'b\nac\n' then pause,end
if strsubst('b\nac\n','/aa\z/m'                              ,' ' ,'r') <>  'b\nac\n'  then pause,end
if strsubst('b\nac\n','/aa$/m'                               ,' ' ,'r') <>  'b\nac\n' then pause,end
if strsubst('b\nac'  ,'/aa\Z/m'                              ,' ' ,'r') <>  'b\nac'  then pause,end
if strsubst('b\nac'  ,'/aa\z/m'                              ,' ' ,'r') <>  'b\nac'  then pause,end
if strsubst('b\nac'  ,'/aa$/m'                               ,' ' ,'r') <>  'b\nac' then pause,end
if strsubst('ca\nb\n','/aa\Z/'                               ,' ' ,'r') <>  'ca\nb\n'  then pause,end
if strsubst('ca\nb\n','/aa\z/'                               ,' ' ,'r') <>  'ca\nb\n'  then pause,end
if strsubst('ca\nb\n','/aa$/'                                ,' ' ,'r') <>  'ca\nb\n'  then pause,end
if strsubst('b\nca\n','/aa\Z/'                               ,' ' ,'r') <>  'b\nca\n'  then pause,end
if strsubst('b\nca\n','/aa\z/'                               ,' ' ,'r') <>  'b\nca\n' then pause,end
if strsubst('b\nca\n','/aa$/'                                ,' ' ,'r') <>  'b\nca\n'  then pause,end
if strsubst('b\nca'  ,'/aa\Z/'                               ,' ' ,'r') <>  'b\nca'   then pause,end
if strsubst('b\nca'  ,'/aa\z/'                               ,' ' ,'r') <> 'b\nca'   then pause,end
if strsubst('b\nca'  ,'/aa$/'                                ,' ' ,'r') <>  'b\nca'  then pause,end
if strsubst('ca\nb\n','/aa\Z/m'                              ,' ' ,'r') <> 'ca\nb\n'  then pause,end
if strsubst('ca\nb\n','/aa\z/m'                              ,' ' ,'r') <>  'ca\nb\n'  then pause,end
if strsubst('ca\nb\n','/aa$/m'                               ,' ' ,'r') <>  'ca\nb\n' then pause,end
if strsubst('b\nca\n','/aa\Z/m'                              ,' ' ,'r') <> 'b\nca\n'  then pause,end
if strsubst('b\nca\n','/aa\z/m'                              ,' ' ,'r') <> 'b\nca\n'  then pause,end
if strsubst('b\nca\n','/aa$/m'                               ,' ' ,'r') <> 'b\nca\n'  then pause,end
if strsubst('b\nca'  ,'/aa\Z/m'                              ,' ' ,'r') <>  'b\nca'  then pause,end
if strsubst('b\nca'  ,'/aa\z/m'                              ,' ' ,'r') <>  'b\nca'   then pause,end
if strsubst('b\nca'  ,'/aa$/m'                               ,' ' ,'r') <>  'b\nca'   then pause,end
if strsubst('ab\nb\n','/ab\Z/'                               ,' ' ,'r') <>  'ab\nb\n'  then pause,end
if strsubst('ab\nb\n','/ab\z/'                               ,' ' ,'r') <>  'ab\nb\n' then pause,end
if strsubst('ab\nb\n','/ab$/'                                ,' ' ,'r') <> 'ab\nb\n'  then pause,end
if strsubst('b\nab\n','/ab\z/'                               ,' ' ,'r') <>  'b\nab\n' then pause,end
if strsubst('ab\nb\n','/ab\Z/m'                              ,' ' ,'r') <>  'ab\nb\n'  then pause,end
if strsubst('ab\nb\n','/ab\z/m'                              ,' ' ,'r') <>  'ab\nb\n'  then pause,end
if strsubst('b\nab\n','/ab\z/m'                              ,' ' ,'r') <> 'b\nab\n'  then pause,end
if strsubst('ac\nb\n','/ab\Z/'                               ,' ' ,'r') <> 'ac\nb\n'  then pause,end
if strsubst('ac\nb\n','/ab\z/'                               ,' ' ,'r') <> 'ac\nb\n' then pause,end
if strsubst('ac\nb\n','/ab$/'                                ,' ' ,'r') <>  'ac\nb\n'  then pause,end
if strsubst('b\nac\n','/ab\Z/'                               ,' ' ,'r') <>  'b\nac\n'  then pause,end
if strsubst('b\nac\n','/ab\z/'                               ,' ' ,'r') <>  'b\nac\n' then pause,end
if strsubst('b\nac\n','/ab$/'                                ,' ' ,'r') <>  'b\nac\n'  then pause,end
if strsubst('b\nac'  ,'/ab\Z/'                               ,' ' ,'r') <>  'b\nac'  then pause,end
if strsubst('b\nac'  ,'/ab\z/'                               ,' ' ,'r') <>  'b\nac' then pause,end
if strsubst('b\nac'  ,'/ab$/'                                ,' ' ,'r') <> 'b\nac' then pause,end
if strsubst('ac\nb\n','/ab\Z/m'                              ,' ' ,'r') <>  'ac\nb\n'  then pause,end
if strsubst('ac\nb\n','/ab\z/m'                              ,' ' ,'r') <> 'ac\nb\n'  then pause,end
if strsubst('ac\nb\n','/ab$/m'                               ,' ' ,'r') <>  'ac\nb\n'  then pause,end
if strsubst('b\nac\n','/ab\Z/m'                              ,' ' ,'r') <> 'b\nac\n'  then pause,end
if strsubst('b\nac\n','/ab\z/m'                              ,' ' ,'r') <> 'b\nac\n' then pause,end
if strsubst('b\nac\n','/ab$/m'                               ,' ' ,'r') <>  'b\nac\n'  then pause,end
if strsubst('b\nac'  ,'/ab\Z/m'                              ,' ' ,'r') <>  'b\nac'   then pause,end
if strsubst('b\nac'  ,'/ab\z/m'                              ,' ' ,'r') <>  'b\nac'  then pause,end
if strsubst('b\nac'  ,'/ab$/m'                               ,' ' ,'r') <>  'b\nac'   then pause,end
if strsubst('ca\nb\n','/ab\Z/'                               ,' ' ,'r') <>  'ca\nb\n' then pause,end
if strsubst('ca\nb\n','/ab\z/'                               ,' ' ,'r') <>  'ca\nb\n'  then pause,end
if strsubst('ca\nb\n','/ab$/'                                ,' ' ,'r') <>  'ca\nb\n'  then pause,end
if strsubst('b\nca\n','/ab\Z/'                               ,' ' ,'r') <>  'b\nca\n'  then pause,end
if strsubst('b\nca\n','/ab\z/'                               ,' ' ,'r') <> 'b\nca\n'  then pause,end
if strsubst('b\nca\n','/ab$/'                                ,' ' ,'r') <>  'b\nca\n'  then pause,end
if strsubst('b\nca'  ,'/ab\Z/'                               ,' ' ,'r') <>  'b\nca'  then pause,end
if strsubst('b\nca'  ,'/ab\z/'                               ,' ' ,'r') <>  'b\nca'  then pause,end
if strsubst('b\nca'  ,'/ab$/'                                ,' ' ,'r') <> 'b\nca'  then pause,end
if strsubst('ca\nb\n','/ab\Z/m'                              ,' ' ,'r') <>  'ca\nb\n'  then pause,end
if strsubst('ca\nb\n','/ab\z/m'                              ,' ' ,'r') <>  'ca\nb\n' then pause,end
if strsubst('ca\nb\n','/ab$/m'                               ,' ' ,'r') <> 'ca\nb\n'  then pause,end
if strsubst('b\nca\n','/ab\Z/m'                              ,' ' ,'r') <> 'b\nca\n' then pause,end
if strsubst('b\nca\n' ,'/ab\z/m'                              ,' ' ,'r') <> 'b\nca\n'  then pause,end
if strsubst('b\nca\n','/ab$/m'                               ,' ' ,'r') <>  'b\nca\n'  then pause,end
if strsubst('b\nca'     ,'/ab\Z/m'                              ,' ' ,'r') <> 'b\nca'   then pause,end
if strsubst('b\nca'     ,'/ab\z/m'                              ,' ' ,'r') <>  'b\nca'   then pause,end
if strsubst('b\nca'     ,'/ab$/m'                               ,' ' ,'r') <>  'b\nca'   then pause,end
if strsubst('abb\nb\n'  ,'/abb\Z/'                              ,' ' ,'r') <>  'abb\nb\n'  then pause,end
if strsubst('abb\nb\n'  ,'/abb\z/'                              ,' ' ,'r') <>  'abb\nb\n'  then pause,end
if strsubst('abb\nb\n'  ,'/abb$/'                               ,' ' ,'r') <>  'abb\nb\n'  then pause,end
if strsubst('b\nabb\n'  ,'/abb\z/'                              ,' ' ,'r') <>  'b\nabb\n'   then pause,end
if strsubst('abb\nb\n'  ,'/abb\Z/m'                             ,' ' ,'r') <> 'abb\nb\n'  then pause,end
if strsubst('abb\nb\n'  ,'/abb\z/m'                             ,' ' ,'r') <>  'abb\nb\n'  then pause,end
if strsubst('b\nabb\n','/abb\z/m'                             ,' ' ,'r') <>  'b\nabb\n'  then pause,end
if strsubst('ac\nb\n'  ,'/abb\Z/'                              ,' ' ,'r') <>  'ac\nb\n'  then pause,end
if strsubst('ac\nb\n'  ,'/abb\z/'                              ,' ' ,'r') <>  'ac\nb\n' then pause,end
if strsubst('ac\nb\n'  ,'/abb$/'                               ,' ' ,'r') <> 'ac\nb\n'  then pause,end
if strsubst('b\nac\n' ,'/abb\Z/'                              ,' ' ,'r') <> 'b\nac\n'  then pause,end
if strsubst('b\nac\n'  ,'/abb\z/'                              ,' ' ,'r') <>  'b\nac\n' then pause,end
if strsubst('b\nac\n'   ,'/abb$/'                               ,' ' ,'r') <>  'b\nac\n'  then pause,end
if strsubst('b\nac'     ,'/abb\Z/'                              ,' ' ,'r') <>  'b\nac'  then pause,end
if strsubst('b\nac'   ,'/abb\z/'                              ,' ' ,'r') <> 'b\nac'  then pause,end
if strsubst('b\nac'   ,'/abb$/'                               ,' ' ,'r') <>  'b\nac'  then pause,end
if strsubst('ac\nb\n'   ,'/abb\Z/m'                             ,' ' ,'r') <>  'ac\nb\n'   then pause,end
if strsubst('ac\nb\n'     ,'/abb\z/m'                             ,' ' ,'r') <> 'ac\nb\n'   then pause,end
if strsubst('ac\nb\n'  ,'/abb$/m'                              ,' ' ,'r') <>  'ac\nb\n'  then pause,end
if strsubst('b\nac\n' ,'/abb\Z/m'                             ,' ' ,'r') <>  'b\nac\n'   then pause,end
if strsubst('b\nac\n'    ,'/abb\z/m'                             ,' ' ,'r') <> 'b\nac\n'   then pause,end
if strsubst('b\nac\n'    ,'/abb$/m'                              ,' ' ,'r') <>  'b\nac\n'   then pause,end
if strsubst('b\nac'     ,'/abb\Z/m'                             ,' ' ,'r') <>  'b\nac'   then pause,end
if strsubst('b\nac'   ,'/abb\z/m'                             ,' ' ,'r') <>  'b\nac'   then pause,end
if strsubst('b\nac'    ,'/abb$/m'                              ,' ' ,'r') <>  'b\nac'   then pause,end
if strsubst('ca\nb\n'   ,'/abb\Z/'                              ,' ' ,'r') <>  'ca\nb\n'  then pause,end
if strsubst('ca\nb\n' ,'/abb\z/'                              ,' ' ,'r') <>  'ca\nb\n'  then pause,end
if strsubst('ca\nb\n'  ,'/abb$/'                               ,' ' ,'r') <>  'ca\nb\n'  then pause,end
if strsubst('b\nca\n' ,'/abb\Z/'                              ,' ' ,'r') <>  'b\nca\n'   then pause,end
if strsubst('b\nca\n'   ,'/abb\z/'                              ,' ' ,'r') <>  'b\nca\n'   then pause,end
if strsubst('b\nca\n'   ,'/abb$/'                               ,' ' ,'r') <>  'b\nca\n'   then pause,end
if strsubst('b\nca'       ,'/abb\Z/'                              ,' ' ,'r') <>  'b\nca'   then pause,end
if strsubst('b\nca'         ,'/abb\z/'                              ,' ' ,'r') <> 'b\nca'   then pause,end
if strsubst('b\nca'        ,'/abb$/'                               ,' ' ,'r') <>  'b\nca'   then pause,end
if strsubst('ca\nb\n'     ,'/abb\Z/m'                             ,' ' ,'r') <>  'ca\nb\n'   then pause,end
if strsubst('ca\nb\n'   ,'/abb\z/m'                             ,' ' ,'r') <> 'ca\nb\n'   then pause,end
if strsubst('ca\nb\n'    ,'/abb$/m'                              ,' ' ,'r') <> 'ca\nb\n'   then pause,end
if strsubst('b\nca\n'     ,'/abb\Z/m'                             ,' ' ,'r') <>  'b\nca\n'   then pause,end
if strsubst('b\nca\n'      ,'/abb\z/m'                             ,' ' ,'r') <>  'b\nca\n'   then pause,end
if strsubst('b\nca\n'  ,'/abb$/m'                              ,' ' ,'r') <>  'b\nca\n'  then pause,end
if strsubst('b\nca'       ,'/abb\Z/m'                             ,' ' ,'r') <>  'b\nca' then pause,end
if strsubst('b\nca'       ,'/abb\z/m'                             ,' ' ,'r') <>  'b\nca'  then pause,end
if strsubst('b\nca'            ,'/abb$/m'                              ,' ' ,'r') <>  'b\nca'  then pause,end
if strsubst('aaab'        ,'/^(?=(a+?))\1ab/'                     ,' ' ,'r') <>  'aaab'   then pause,end
if strsubst('aaab'             ,'/^(?=(a+?))\1ab/'                     ,' ' ,'r') <>  'aaab'   then pause,end
if strsubst('abcd:'               ,'/([\w:]+::)?(\w+)$/'                  ,' ' ,'r') <>  'abcd:'   then pause,end
if strsubst('abcd:'            ,'/([\w:]+::)?(\w+)$/'                  ,' ' ,'r') <>   'abcd:'  then pause,end
if strsubst('aaab'                  ,'/(>a+)ab/'                            ,' ' ,'r') <>  'aaab'   then pause,end
//======================================================================================== 
v = "世界您好";
c = "您";
if strsubst(v,c,'ç')<>'世界ç好' then pause,end

v = "азеазея";
c = "з";
if strsubst(v,c,'ç')<>'аçеаçея'  then pause,end

v = "ድቅስድቅስግ";
c = "ቅ";
if strsubst(v,c,'ç')<> 'ድçስድçስግ'  then pause,end

v = "ハロー・ワールド";
c = "ド";
if strsubst(v,c,'ç')<> 'ハロー・ワールç'  then pause,end

v = "เฮลโลเวิลด์";
c = "เ"; 
if strsubst(v,c,'ç')<> 'çฮลโลçวิลด์' then pause,end

v = "حريات وحقوق";
c = "قوق";
if strsubst(v,c,'ç')<> 'حريات وحç'  then pause,end

v = "ഹലോ വേള്‍ഡ";
c = "‍ഡ"; 
if strsubst(v,c,'ç')<>'ഹലോ വേള്ç'  then pause,end

v = "תוכנית";
c = "י";
if strsubst(v,c,'ç')<>'תוכנçת'  then pause,end
//===============================
// Chinese
str = '世界您好';
if strsubst(str,'/^世界/','ç','r') <> 'ç您好' then pause,end

if strsubst(str,'/世界$/','ç','r') <> str then pause,end

if strsubst(str,'/您好$/','ç','r') <> '世界ç' then pause,end

if strsubst(str,'/^您好/','ç','r') <> str then pause,end

if strsubst(str,'/界您/','ç','r') <> '世ç好' then pause,end

if strsubst(str,'/界_您/','ç','r') <> str then pause,end
//======================================================================================== 
// Russian
str = 'привет мир';
if strsubst(str,'/^привет/','ç','r') <> 'ç мир' then pause,end

if strsubst(str,'/привет$/','ç','r') <> str then pause,end

if strsubst(str,'/мир$/','ç','r') <> 'привет ç' then pause,end

if strsubst(str,'/^мир/','ç','r') <> str then pause,end

if strsubst(str,'/вет\sм/','ç','r') <> 'приçир' then pause,end

if strsubst(str,'/вет_м/','ç','r') <> 'привет мир' then pause,end
//======================================================================================== 
// Cyrilic
str = 'АБВГДЄЖЅЗИІКЛМНОПҀРСТѸФХѠЦЧШЩЪЪІЬѢЮѦѨѪѬѮѰѲѴѤ';

if strsubst(str,'/^АБВГДЄЖЅЗИІКЛМНОПҀР/','ç','r') <> 'çСТѸФХѠЦЧШЩЪЪІЬѢЮѦѨѪѬѮѰѲѴѤ' then pause,end

if strsubst(str,'/АБВГДЄЖЅЗИІКЛМНОПҀР$/','ç','r') <> str then pause,end

if strsubst(str,'/ЧШЩЪЪІЬѢЮѦѨѪѬѮѰѲѴѤ$/','ç','r') <> 'АБВГДЄЖЅЗИІКЛМНОПҀРСТѸФХѠЦç' then pause,end

if strsubst(str,'/^ЧШЩЪЪІЬѢЮѦѨѪѬѮѰѲѴѤ/','ç','r') <> str then pause,end

if strsubst(str,'/ИІКЛМНОПҀРСТѸФХѠЦЧШЩЪ/','ç','r') <> 'АБВГДЄЖЅЗçЪІЬѢЮѦѨѪѬѮѰѲѴѤ' then pause,end

if strsubst(str,'/ИІКЛМНОПҀ_РСТѸФХѠЦЧШЩЪ/','ç','r') <> str then pause,end
//======================================================================================== 
// Japanese
str = '丑丞串乃之乎也云亘亙些亦亥亨亮仔伊伎伍伽佃佑伶侃侑俄侠俣俐侶倭俺倶倦倖偲僅傭儲允兎兜其冥冴冶凄凌凜凛凧凪凰凱函刹劉劫勁勃';

if strsubst(str,'/^丑丞串乃之乎也云亘亙些亦/','ç','r') <> 'ç亥亨亮仔伊伎伍伽佃佑伶侃侑俄侠俣俐侶倭俺倶倦倖偲僅傭儲允兎兜其冥冴冶凄凌凜凛凧凪凰凱函刹劉劫勁勃' then pause,end

if strsubst(str,'/丑丞串乃之乎也云亘亙些亦$/','ç','r') <> str then pause,end

if strsubst(str,'/凰凱函刹劉劫勁勃$/','ç','r') <> '丑丞串乃之乎也云亘亙些亦亥亨亮仔伊伎伍伽佃佑伶侃侑俄侠俣俐侶倭俺倶倦倖偲僅傭儲允兎兜其冥冴冶凄凌凜凛凧凪ç' then pause,end

if strsubst(str,'/^凰凱函刹劉劫勁勃/','ç','r') <> str then pause,end

if strsubst(str,'/亨亮仔伊伎伍伽佃佑伶侃/','ç','r') <> '丑丞串乃之乎也云亘亙些亦亥ç侑俄侠俣俐侶倭俺倶倦倖偲僅傭儲允兎兜其冥冴冶凄凌凜凛凧凪凰凱函刹劉劫勁勃' then pause,end

if strsubst(str,'/亨亮仔伊_伎伍伽佃佑伶侃/','ç','r') <> str then pause,end
//======================================================================================== 
// Thaï
str = 'มกระดุกกระดิก';
if strsubst(str,'/^มกระดุกกร/','ç','r')<>'çะดิก' then pause,end

if strsubst(str,'/มกระดุกกร$/','ç','r') <> str then pause,end

if strsubst(str,'/กกระดิก$/','ç','r')<>'มกระดุç' then pause,end

if strsubst(str,'/^กกระดิก/','ç','r') <> str then pause,end

if strsubst(str,'/ดุกก/','ç','r')<>'มกระçระดิก' then pause,end

if strsubst(str,'/ดุก_ก/','ç','r') <> str then pause,end
//======================================================================================== 
