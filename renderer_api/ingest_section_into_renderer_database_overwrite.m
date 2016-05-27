function ingest_section_into_renderer_database_overwrite(mL,rc, rc_base, dir_work, translate_to_positive_space)
% This is a high-level function that:
% Deletes the rc_target collection if it already exists
% Creates a new collection (stack or section) for the specified tiles in mL
% Ingests the data
% Completes the collection
%
% Since collections are based off of other collections. In this case the base
% collection is specified in the rc_base struct
%
% Author: Khaled Khairy. Janelia Research Campus.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if nargin<5, translate_to_positive_space = 1;end

resp = delete_renderer_stack(rc);
resp = create_renderer_stack(rc);

ingest_section_into_renderer_database(mL, rc, rc_base, dir_work, translate_to_positive_space);