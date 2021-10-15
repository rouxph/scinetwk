printf('***************************************\n')
printf('** compilation of scinetwk toolbox     **\n')
printf('***************************************\n')
try
 getversion("scilab");
catch
 error("Scilab 5.0 or more is required.");
end;
toolbox_title="scinetwk";
path=get_absolute_file_path("builder.sce")
//  compile macros
printf('***************************************\n')
printf('** compilation of macros/*.sci files **\n')
printf('***************************************\n')
cd(path+"macros")
exec("cleanmacros.sce")
exec("buildmacros.sce")
// generate  help  
printf('***************************************\n')
printf('** generating help files (xml/pdf)   **\n')
printf('***************************************\n')
cd("../help")
exec("builder_help.sce")
cd("../")
xmltopdf('help/en_US',toolbox_title,'pdf');
//load
printf('\n***************************************\n')
printf('** loading  toolbox scinetwk           **\n')
printf('***************************************\n')
exec('etc/scinetwk.quit',-1)
exec('loader.sce',-1)
// run unit_tests
printf('***************************************\n')
printf('** running tests in test/*.tst files **\n')
printf('***************************************\n')
status=%t//status=test_run('.',[],'create_ref')
if status then
printf('*****************************************\n')
printf('** successful compilation of scinetwk !**\n')
printf('** next time execute file loader.sce ****\n')
printf('*****************************************\n')
printf('*****************************************\n')
printf('** read online help '"help scinetwk'" ***\n')
printf('*****************************************\n')
help scinetwk
else
printf('***************************************\n')
printf('**/!\\ errors detected! check tests/!\\**\n')
printf('** next time execute file loader.sce **\n')
printf('***************************************\n')
end
