// This file is released under the 3-clause BSD license. See COPYING-BSD.
// Generated by builder.sce : Please, do not edit this file
// ----------------------------------------------------------------------------
//
fsum_path = get_absolute_file_path('loader.sce');
//
// ulink previous function with same name
[bOK, ilib] = c_link('fsum');
if bOK then
  ulink(ilib);
end
//
link(fsum_path + 'libfsum' + getdynlibext(), ['fsum'],'f');
// remove temp. variables on stack
clear fsum_path;
clear bOK;
clear ilib;
// ----------------------------------------------------------------------------
