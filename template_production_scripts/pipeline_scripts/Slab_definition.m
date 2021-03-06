global rough_collection fine_collection nfirstvec nlastvec

%% Overall source collection definition
% configure source collection
rcsource.stack          = 'v12_acquire_merged';
rcsource.owner          ='flyTEM';
rcsource.project        = 'FAFB00';
rcsource.service_host   = '10.37.5.60:8080';
rcsource.baseURL        = ['http://' rcsource.service_host '/render-ws/v1'];
rcsource.verbose        = 1;

%% rough collection definition
rctarget_rough.stack          = '';
rctarget_rough.owner          ='flyTEM';
rctarget_rough.project        = 'test2';
rctarget_rough.service_host   = '10.37.5.60:8080';
rctarget_rough.baseURL        = ['http://' rctarget_rough.service_host '/render-ws/v1'];
rctarget_rough.verbose        = 1;

%% fine collection definition
rctarget_fine.stack          = '';
rctarget_fine.owner          ='flyTEM';
rctarget_fine.project        = 'test2';
rctarget_fine.service_host   = '10.37.5.60:8080';
rctarget_fine.baseURL        = ['http://' rctarget_rough.service_host '/render-ws/v1'];
rctarget_fine.verbose        = 1;

%% fixed stack for whole volume fusion

% configure fixed collection
rcfixed_o.stack          = ['FULL_FAFB_FUSED'];
rcfixed_o.owner          ='flyTEM';
rcfixed_o.project        = 'test2';
rcfixed_o.service_host   = '10.37.5.60:8080';
rcfixed_o.baseURL        = ['http://' rcfixed_o.service_host '/render-ws/v1'];
rcfixed_o.verbose        = 1;

%% define slabs
nfirstvec = [ 1   20     40   120    250    500   750   1000   1150  1300  1450  1600     1750  1950   2100   2250  ...
        2400:75:6900  6975];


nlastvec =  [35   45    150   300    550    800   1050  1200   1350  1500  1650  1800     2000  2150   2300   2450  ...
        2500:75:7000  7062];

%% define the scale

scalevec = [0.1   0.1   0.07  0.06  0.06    0.055 0.05  0.035  0.035 0.035 0.035 0.035   0.035  0.035  0.035  0.035 ...
         ones(1, 8) * 0.03 ... % 2400 - 3000
         ones(1, 14) * 0.025 ... % 3000 - 4050 
         ones(1, 26) * 0.02 ... % 4050 - 6000
         ones(1, 6) * 0.025 ... % 6000 - 6450
         ones(1, 8) * 0.034]; % 6450 -


%% define overlap vector
overlapvec = [nfirstvec(2:end)' nlastvec(1:end-1)'];
last_processed_rough = 24;
run_now_vec_rough = [zeros(1,last_processed_rough) ones(1,length(scalevec)-last_processed_rough)];
nslabs = numel(nfirstvec);
%% additional configurations
dir_store_rough_slab = '/nobackup/flyTEM/khairy/FAFB00v13/matlab_slab_rough_aligned';

%% generate collections
rough_collection = cell(1, numel(nslabs));
fine_collection = cell(1, numel(nslabs));
rough_stack = cell(1, numel(nslabs));
fine_stack = cell(1, numel(nslabs));
rough_collection_exists_str = cell(1, numel(nslabs));
fine_collection_exists_str = cell(1, numel(nslabs));
run_now_vec_fine = false(1, numel(nslabs));

for ixs = 1:nslabs
    rough_collection{ixs}       = rctarget_rough;
    rough_collection{ixs}.stack = ['PROD_ROUGH_MP1_RR_' num2str(nfirstvec(ixs)) '_' num2str(nlastvec(ixs))];
    rough_stack{ixs} = rough_collection{ixs}.stack;

    fine_collection{ixs} = rctarget_fine;
    fine_collection{ixs}.nfirst = nfirstvec(ixs);
    fine_collection{ixs}.nlast  = nlastvec(ixs);
    fine_collection{ixs}.stack    = ['PROD_FINE_MP1_RR_P1_' num2str(nfirstvec(ixs)) '_' num2str(nlastvec(ixs)) '_xs_2'];
    fine_stack{ixs} = fine_collection{ixs}.stack;

    % check stack existence

    rough_collection_exists = stack_exists(rough_collection{ixs});

    if rough_collection_exists,
        rough_collection_exists_str{ixs} = 'X';
    else
        rough_collection_exists_str{ixs} = 'O';
    end
    run_now_vec_rough(ixs) = ~rough_collection_exists;

    fine_collection_exists = stack_exists(fine_collection{ixs});
    if fine_collection_exists,
        fine_collection_exists_str{ixs} = 'X';
    else
        fine_collection_exists_str{ixs} = 'O';
    end
    run_now_vec_fine(ixs) = ~fine_collection_exists;
end


%% disp
TB = table([1:nslabs]', [rough_stack(:)], [rough_collection_exists_str(:)],...
    [fine_stack(:)], [fine_collection_exists_str(:)],...
    nfirstvec', nlastvec', scalevec', ...
    run_now_vec_rough', ...
    'VariableNames', {'Slab', 'Rough_collection', 'Rough_collection_exists', ...
    'Fine_collection', 'Fine_collection_exists', 'Slab_start', 'Slab_end', 'Slab_scale_factor', 'Run_rough_flag'});
disp(TB)
