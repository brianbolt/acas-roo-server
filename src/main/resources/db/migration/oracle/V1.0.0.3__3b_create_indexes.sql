--more indexes for FKs and other

CREATE UNIQUE INDEX EXPT_LABEL_UNIQ ON EXPERIMENT_LABEL (LS_TYPE_AND_KIND, LABEL_TEXT, IGNORED);
CREATE UNIQUE INDEX PROT_LABEL_UNIQ ON PROTOCOL_LABEL (LS_TYPE_AND_KIND, LABEL_TEXT, IGNORED);

create index expt_label_txt_idx ON experiment_label(label_text);
create index prot_label_txt_idx ON protocol_label(label_text);
create index cont_label_txt_idx ON container_label(label_text);

--many to many changes
CREATE INDEX expt_ag_exptid_idx ON experiment_analysisgroup (experiment_id);
CREATE INDEX expt_ag_agid_idx ON experiment_analysisgroup (analysis_group_id);
CREATE INDEX ag_trtgrp_agid_idx ON analysisgroup_treatmentgroup (analysis_group_id);
CREATE INDEX ag_trtgrp_trtgrpid_idx ON analysisgroup_treatmentgroup (treatment_group_id);
CREATE INDEX trtgrp_subj_trtgrpid_idx ON treatmentgroup_subject(treatment_group_id);
CREATE INDEX trtgrp_subj_subjid_idx ON treatmentgroup_subject(subject_id);


create index sbjlbl_sbj_fk ON subject_label(subject_id);
create index sbjst_sbj_fk ON subject_state(subject_id);
create index sbjvl_sbjst_fk ON subject_value(subject_state_id);

create index trtgrplbl_trtgrp_fk ON treatment_group_label(treatment_group_id);
create index trtgrpst_trtgrp_fk ON treatment_group_state(treatment_group_id);
create index trtgrpvl_trtgrpst_fk ON treatment_group_value(treatment_state_id);

create index anlygrplbl_anlygrp_fk ON analysis_group_label(analysis_group_id);
create index anlygrpst_anlygrp_fk ON analysis_group_state(analysis_group_id);
create index anlygrpvl_anlygrpst_fk ON analysis_group_value(analysis_state_id);

create index exptlbl_exp_fk ON experiment_label(experiment_id);
create index expst_exp_fk ON experiment_state(experiment_id);
create index exptvl_exp_fk ON experiment_value(experiment_state_id);

create index protlbl_prot_fk ON protocol_label(protocol_id);
create index protst_prot_fk ON protocol_state(protocol_id);
create index protvl_protst_fk ON protocol_value(protocol_state_id);

create index cntrlbl_cntr_fk ON container_label(container_id);
create index cntrst_cntr_fk ON container_state(container_id);
create index cntrvl_cntrst_fk ON container_value(container_state_id); 


create index itxcntr_cntr1_fk ON itx_container_container(first_container_id);
create index itxcntr_cntr2_fk ON itx_container_container(second_container_id);
create index itxcntrst_itxcntr_fk ON itx_container_container_state(itx_container_container);
create index itxcntrvl_itxcntrst_fk ON itx_container_container_value(ls_state);

create index itxsubjcntr_subj_fk ON itx_subject_container(subject_id);
create index itxsubjcntr_cntr_fk ON itx_subject_container(container_id);
create index itxsbcntrst_itxcntr_fk ON itx_subject_container_state(itx_subject_container);
create index itxsbcntrvl_itxcntrst_fk ON itx_subject_container_value(ls_state);



create index itx_cntrs_KIND_IDX ON itx_container_container (ls_kind);
create index itx_cntrs_TRXN_IDX ON itx_container_container (ls_transaction);
create index itx_cntrs_TYPE_IDX ON itx_container_container (ls_type);
create index itx_cntrs_REC_BY_IDX ON itx_container_container (recorded_by);
create index itx_cntrs_IGNORED_IDX ON itx_container_container (ignored);
create index itx_cntrs_REC_DATE_IDX ON itx_container_container (recorded_date);
create index itx_cntrs_state_TK_IDX ON itx_container_container_state (ls_type_and_kind);
create index itx_cntrs_value_TRXN_IDX ON itx_container_container_value (ls_transaction);
create index itx_cntrs_value_UNTK_IDX ON itx_container_container_value (unit_type_and_kind);
create index itx_cntrs_value_TK_IDX ON itx_container_container_value (ls_type_and_kind);
create index itx_cntrs_value_OPTK_IDX ON itx_container_container_value (operator_type_and_kind);
create index itx_cntrs_value_REC_BY_IDX ON itx_container_container_value (recorded_by);
create index itx_subj_cont_REC_BY_IDX ON itx_subject_container (recorded_by);
create index itx_subj_cont_REC_DATE_IDX ON itx_subject_container (recorded_date);
create index itx_subj_cont_state_TK_IDX ON itx_subject_container_state (ls_type_and_kind);
create index itx_subj_cont_value_TRXN_IDX ON itx_subject_container_value (ls_transaction);
create index itx_subj_cont_value_UNTK_IDX ON itx_subject_container_value (unit_type_and_kind);
create index itx_subj_cont_value_TK_IDX ON itx_subject_container_value (ls_type_and_kind);
create index itx_subj_cont_value_OPTK_IDX ON itx_subject_container_value (operator_type_and_kind);
create index itx_subj_cont_value_REC_BY_IDX ON itx_subject_container_value (recorded_by);

-- note: may need to add additional foreign key constrains


alter table
   PROTOCOL
add constraint
   PROTOCOL_TK_FK FOREIGN KEY (LS_TYPE_AND_KIND)
references
   PROTOCOL_KIND (LS_TYPE_AND_KIND);

alter table
   EXPERIMENT
add constraint
   EXPERIMENT_TK_FK FOREIGN KEY (LS_TYPE_AND_KIND)
references
   EXPERIMENT_KIND (LS_TYPE_AND_KIND);

alter table
   PROTOCOL_STATE
add constraint
   PS_TK_FK FOREIGN KEY (LS_TYPE_AND_KIND)
references
   STATE_KIND (LS_TYPE_AND_KIND);

alter table
   EXPERIMENT_STATE
add constraint
   ES_TK_FK FOREIGN KEY (LS_TYPE_AND_KIND)
references
   STATE_KIND (LS_TYPE_AND_KIND);

alter table
   ANALYSIS_GROUP_STATE
add constraint
   AGS_TK_FK FOREIGN KEY (LS_TYPE_AND_KIND)
references
   STATE_KIND (LS_TYPE_AND_KIND);

alter table
   CONTAINER_STATE
add constraint
   CS_TK_FK FOREIGN KEY (LS_TYPE_AND_KIND)
references
   STATE_KIND (LS_TYPE_AND_KIND);

alter table
   TREATMENT_GROUP_STATE
add constraint
   TGS_TK_FK FOREIGN KEY (LS_TYPE_AND_KIND)
references
   STATE_KIND (LS_TYPE_AND_KIND);

alter table
   SUBJECT_STATE
add constraint
   SS_TK_FK FOREIGN KEY (LS_TYPE_AND_KIND)
references
   STATE_KIND (LS_TYPE_AND_KIND);

alter table
   PROTOCOL_VALUE
add constraint
   PV_TK_FK FOREIGN KEY (LS_TYPE_AND_KIND)
references
   VALUE_KIND (LS_TYPE_AND_KIND);

alter table
   EXPERIMENT_VALUE
add constraint
   EV_TK_FK FOREIGN KEY (LS_TYPE_AND_KIND)
references
   VALUE_KIND (LS_TYPE_AND_KIND);

alter table
   ANALYSIS_GROUP_VALUE
add constraint
   AGV_TK_FK FOREIGN KEY (LS_TYPE_AND_KIND)
references
   VALUE_KIND (LS_TYPE_AND_KIND);


alter table
   TREATMENT_GROUP_VALUE
add constraint
   TGV_TK_FK FOREIGN KEY (LS_TYPE_AND_KIND)
references
   VALUE_KIND (LS_TYPE_AND_KIND);

alter table
   SUBJECT_VALUE
add constraint
   SV_TK_FK FOREIGN KEY (LS_TYPE_AND_KIND)
references
   VALUE_KIND (LS_TYPE_AND_KIND);


alter table
   PROTOCOL_LABEL
add constraint
   PL_TK_FK FOREIGN KEY (LS_TYPE_AND_KIND)
references
   LABEL_KIND (LS_TYPE_AND_KIND);

alter table
   EXPERIMENT_LABEL
add constraint
   EL_TK_FK FOREIGN KEY (LS_TYPE_AND_KIND)
references
   LABEL_KIND (LS_TYPE_AND_KIND);


alter table
   ANALYSIS_GROUP_LABEL
add constraint
   AGL_TK_FK FOREIGN KEY (LS_TYPE_AND_KIND)
references
   LABEL_KIND (LS_TYPE_AND_KIND);

alter table
   TREATMENT_GROUP_LABEL
add constraint
   TGL_TK_FK FOREIGN KEY (LS_TYPE_AND_KIND)
references
   LABEL_KIND (LS_TYPE_AND_KIND);

alter table
   SUBJECT_LABEL
add constraint
   SL_TK_FK FOREIGN KEY (LS_TYPE_AND_KIND)
references
   LABEL_KIND (LS_TYPE_AND_KIND);


alter table
   CONTAINER_LABEL
add constraint
   CL_TK_FK FOREIGN KEY (LS_TYPE_AND_KIND)
references
   LABEL_KIND (LS_TYPE_AND_KIND);
