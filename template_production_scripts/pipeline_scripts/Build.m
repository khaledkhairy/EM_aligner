%% Define compiler commands
EM_ALIGNER_LIB_DIR = '../EM_aligner';

generate_slab_definitions = [...
    'mcc '...
	'-v '...
	'-m generate_slab_definitions ' ...
	'-d bin ' ...
	'-I ' EM_ALIGNER_LIB_DIR '/external ' ...
	'-I ' EM_ALIGNER_LIB_DIR '/renderer_api ' ...
	'-I ' EM_ALIGNER_LIB_DIR '/external/jsonlab ' ...
	'-I .' ...
    ];

generate_diagnostic_stats = [...
    'mcc '...
	'-v '...
	'-m generate_diagnostic_stats ' ...
	'-d bin ' ...
	'-I ' EM_ALIGNER_LIB_DIR '/classes ' ...
	'-I ' EM_ALIGNER_LIB_DIR '/level_0 ' ...
	'-I ' EM_ALIGNER_LIB_DIR '/level_1 ' ...
	'-I ' EM_ALIGNER_LIB_DIR '/renderer_api ' ...
	'-I ' EM_ALIGNER_LIB_DIR '/external/jsonlab ' ...
	'-I .' ...
    ];

r_montage = [
	'mcc ' ...
	'-v ' ...
	'-m Register_montage ' ...
	'-d bin ' ...
	'-I ' EM_ALIGNER_LIB_DIR '/classes ' ...
	'-I ' EM_ALIGNER_LIB_DIR '/solver ' ...
	'-I ' EM_ALIGNER_LIB_DIR '/renderer_api ' ...
	'-I ' EM_ALIGNER_LIB_DIR '/level_0 ' ...
	'-I ' EM_ALIGNER_LIB_DIR '/level_1 ' ...
	'-I ' EM_ALIGNER_LIB_DIR '/external/jsonlab ' ...
	'-I .' ...
    ];

Register_rough = [
	'mcc ' ...
	'-v ' ...
	'-m Register_rough ' ...
	'-d bin ' ...
	'-I ' EM_ALIGNER_LIB_DIR '/classes ' ...
	'-I ' EM_ALIGNER_LIB_DIR '/solver ' ...
	'-I ' EM_ALIGNER_LIB_DIR '/renderer_api ' ...
	'-I ' EM_ALIGNER_LIB_DIR '/level_0 ' ...
	'-I ' EM_ALIGNER_LIB_DIR '/level_1 ' ...
	'-I ' EM_ALIGNER_LIB_DIR '/external/jsonlab ' ...
	'-I .' ...
    ];

Register_fine = [
	'mcc ' ...
	'-v ' ...
	'-m Register_fine ' ...
	'-d bin ' ...
	'-I ' EM_ALIGNER_LIB_DIR '/classes ' ...
	'-I ' EM_ALIGNER_LIB_DIR '/solver ' ...
	'-I ' EM_ALIGNER_LIB_DIR '/renderer_api ' ...
	'-I ' EM_ALIGNER_LIB_DIR '/level_0 ' ...
	'-I ' EM_ALIGNER_LIB_DIR '/level_1 ' ...
	'-I ' EM_ALIGNER_LIB_DIR '/external/jsonlab ' ...
	'-I .'
    ];

Collection_fusion = [
	'mcc ' ...
	'-v ' ...
	'-m Collection_fusion ' ...
	'-d bin ' ...
	'-I ' EM_ALIGNER_LIB_DIR '/classes ' ...
	'-I ' EM_ALIGNER_LIB_DIR '/renderer_api ' ...
	'-I ' EM_ALIGNER_LIB_DIR '/level_0 ' ...
	'-I ' EM_ALIGNER_LIB_DIR '/level_1 ' ...
	'-I ' EM_ALIGNER_LIB_DIR '/external/jsonlab ' ...
	'-I .' ...
    ];

%% Run the compiler
eval(generate_slab_definitions);
eval(generate_diagnostic_stats);
eval(r_montage);
eval(Register_rough);
eval(Register_fine);
eval(Collection_fusion);
