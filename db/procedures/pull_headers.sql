drop procedure if exists proc_auditpull_header;
drop trigger if exists trg_auditpull_header;
delimiter //

create procedure proc_auditpull_header (IN in_id_pull_header int(8), in_user_name varchar(20), in_event_type varchar(20), in_field varchar(64), in_old_value varchar(64), in_new_value varchar(64))
BEGIN
    IF in_old_value != in_new_value THEN
        insert into log_pull_header (id_pull_header, timestamp, user_name, event_type, field, old_value, new_value) values(in_id_pull_header, NOW(), in_user_name, in_event_type, in_field, in_old_value, in_new_value);
    END IF;
END //

create trigger trg_auditpull_header before update on pull_header
for each row
    BEGIN
        call proc_auditpull_header(NEW.id, NEW.name_last_updated, 'update', 'pull_name', OLD.pull_name, NEW.pull_name);
        call proc_auditpull_header(NEW.id, NEW.name_last_updated, 'update', 'pull_description', OLD.pull_description, NEW.pull_description);
        call proc_auditpull_header(NEW.id, NEW.name_last_updated, 'update', 'pull_status', OLD.pull_status, NEW.pull_status);
        call proc_auditpull_header(NEW.id, NEW.name_last_updated, 'update', 'cceb_share', OLD.cceb_share, NEW.cceb_share);
        call proc_auditpull_header(NEW.id, NEW.name_last_updated, 'update', 'tubes_per_request', OLD.tubes_per_request, NEW.tubes_per_request);
        call proc_auditpull_header(NEW.id, NEW.name_last_updated, 'update', 'id_subject_status', OLD.id_subject_status, NEW.id_subject_status);
        call proc_auditpull_header(NEW.id, NEW.name_last_updated, 'update', 'id_subject_value', OLD.id_subject_value, NEW.id_subject_value);
        call proc_auditpull_header(NEW.id, NEW.name_last_updated, 'update', 'sample_type_status', OLD.sample_type_status, NEW.sample_type_status);
        call proc_auditpull_header(NEW.id, NEW.name_last_updated, 'update', 'sample_type_value', OLD.sample_type_value, NEW.sample_type_value);
        call proc_auditpull_header(NEW.id, NEW.name_last_updated, 'update', 'sample_type_value2', OLD.sample_type_value2, NEW.sample_type_value2);
        call proc_auditpull_header(NEW.id, NEW.name_last_updated, 'update', 'shipment_type_status', OLD.shipment_type_status, NEW.shipment_type_status);
        call proc_auditpull_header(NEW.id, NEW.name_last_updated, 'update', 'shipment_type_value', OLD.shipment_type_value, NEW.shipment_type_value);
        call proc_auditpull_header(NEW.id, NEW.name_last_updated, 'update', 'id_study_status', OLD.id_study_status, NEW.id_study_status);
        call proc_auditpull_header(NEW.id, NEW.name_last_updated, 'update', 'id_study_value', OLD.id_study_value, NEW.id_study_value);
        call proc_auditpull_header(NEW.id, NEW.name_last_updated, 'update', 'date_visit_status', OLD.date_visit_status, NEW.date_visit_status);
        call proc_auditpull_header(NEW.id, NEW.name_last_updated, 'update', 'date_visit_value', OLD.date_visit_value, NEW.date_visit_value);
        call proc_auditpull_header(NEW.id, NEW.name_last_updated, 'update', 'date_visit_range', OLD.date_visit_range, NEW.date_visit_range);
        call proc_auditpull_header(NEW.id, NEW.name_last_updated, 'update', 'id_visit_status', OLD.id_visit_status, NEW.id_visit_status);
        call proc_auditpull_header(NEW.id, NEW.name_last_updated, 'update', 'id_visit_value', OLD.id_visit_value, NEW.id_visit_value);
        call proc_auditpull_header(NEW.id, NEW.name_last_updated, 'update', 'quant_thaws_status', OLD.quant_thaws_status, NEW.quant_thaws_status);
        call proc_auditpull_header(NEW.id, NEW.name_last_updated, 'update', 'quant_thaws_value', OLD.quant_thaws_value, NEW.quant_thaws_value);
        call proc_auditpull_header(NEW.id, NEW.name_last_updated, 'update', 'quant_thaws_max', OLD.quant_thaws_max, NEW.quant_thaws_max);
        call proc_auditpull_header(NEW.id, NEW.name_last_updated, 'update', 'alq_num_status', OLD.alq_num_status, NEW.alq_num_status);
        call proc_auditpull_header(NEW.id, NEW.name_last_updated, 'update', 'id_uuid_status', OLD.id_uuid_status, NEW.id_uuid_status);
        call proc_auditpull_header(NEW.id, NEW.name_last_updated, 'update', 'id_uuid_value', OLD.id_uuid_value, NEW.id_uuid_value);
    END //
    
delimiter ;
