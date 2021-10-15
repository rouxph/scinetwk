help_dir = get_absolute_file_path('builder_help.sce');
unix('rm ../demos/*.sce')
unix('rm ../jar/*')
unix('rm en_US/*.xml')
unix('rm en_US/*/*')
help_dir_US = pathconvert( help_dir ) + "en_US" + filesep();
tbx_builder_help_lang("en_US", help_dir);
toolbox_title='scinetwk';//<--  bug dans fonction suivante
tbx_build_help_loader(toolbox_title, help_dir)
