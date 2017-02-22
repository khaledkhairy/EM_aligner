function str = gen_versionNotes(opts)
%
if ~isfield(opts, 'xfac'), opts.xfac = 'n_a';end
if ~isfield(opts, 'yfac'), opts.yfac = 'n_a';end

str = ['l_' num2str(opts.lambda) '_deg_' num2str(opts.degree)...
       '_solver_' opts.solver '_peg_' num2str(opts.use_peg) ...
       '_transfac_' num2str(opts.transfac) '_xfac_' num2str(opts.xfac) ...
       '_yfac_' num2str(opts.yfac)];