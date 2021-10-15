help_lang_dir = get_absolute_file_path('build_help.sce');
help_from_sci('../macros/','../help/en_US','../demos/') // cre
tbx_build_help('scinetwk', help_lang_dir);
clear help_lang_dir;
