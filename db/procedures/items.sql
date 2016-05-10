drop  procedure if exists proc_audititems;
drop trigger if exists trg_audititems;
delimiter //

create procedure proc_audititems (IN in_id_item int(8), in_user_name varchar(20), in_event_type varchar(20), in_field varchar(64), in_old_value varchar(64), in_new_value varchar(64))
BEGIN
    IF in_old_value != in_new_value THEN
        insert into log_items (id_item, timestamp, user_name, event_type, field, old_value, new_value) values(in_id_item, NOW(), in_user_name, in_event_type, in_field, in_old_value, in_new_value);
    END IF;
END //

create trigger trg_audititems before update on items
for each row
    BEGIN
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'id_uuid', OLD.id_uuid, NEW.id_uuid);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'id_alq', OLD.id_alq, NEW.id_alq);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'id_barcode', OLD.id_barcode, NEW.id_barcode);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'id_study', OLD.id_study, NEW.id_study);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'id_subject', OLD.id_subject, NEW.id_subject);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'id_ancillary', OLD.id_ancillary, NEW.id_ancillary);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'id_visit', OLD.id_visit, NEW.id_visit);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'id_parent', OLD.id_parent, NEW.id_parent);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'hemolyzation', OLD.hemolyzation, NEW.hemolyzation);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'unit', OLD.unit, NEW.unit);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'divY', OLD.divY, NEW.divY);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'divX', OLD.divX, NEW.divX);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'type', OLD.type, NEW.type);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'alq_num', OLD.alq_num, NEW.alq_num);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'alq_num2', OLD.alq_num2, NEW.alq_num2);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'alq_pos', OLD.alq_pos, NEW.alq_pos);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'alq_tot', OLD.alq_tot, NEW.alq_tot);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'alq_wpos', OLD.alq_wpos, NEW.alq_wpos);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'date_collection', OLD.date_collection, NEW.date_collection);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'date_create', OLD.date_create, NEW.date_create);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'date_freeze', OLD.date_freeze, NEW.date_freeze);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'date_receipt', OLD.date_receipt, NEW.date_receipt);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'date_sam_create', OLD.date_sam_create, NEW.date_sam_create);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'time_sam_create', OLD.time_sam_create, NEW.time_sam_create);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'date_trans', OLD.date_trans, NEW.date_trans);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'date_visit', OLD.date_visit, NEW.date_visit);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'name_created', OLD.name_created, NEW.name_created);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'name_owner', OLD.name_owner, NEW.name_owner);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'name_last_updated', OLD.name_last_updated, NEW.name_last_updated);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'name_shipper', OLD.name_shipper, NEW.name_shipper);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'quant_cur_tot', OLD.quant_cur_tot, NEW.quant_cur_tot);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'quant_cur', OLD.quant_cur, NEW.quant_cur);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'quant_init', OLD.quant_init, NEW.quant_init);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'quant_thaws', OLD.quant_thaws, NEW.quant_thaws);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'sample_type', OLD.sample_type, NEW.sample_type);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'sample_type2', OLD.sample_type2, NEW.sample_type2);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'shipment_type', OLD.shipment_type, NEW.shipment_type);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'test_type', OLD.test_type, NEW.test_type);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'destination', OLD.destination, NEW.destination);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'seq', OLD.seq, NEW.seq);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'seq_box', OLD.seq_box, NEW.seq_box);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'transaction', OLD.transaction, NEW.transaction);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'share', OLD.share, NEW.share);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'comment1', substr(OLD.comment1, 1, 64), substr(NEW.comment1, 1, 64));
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'comment2', substr(OLD.comment2, 1, 64), substr(NEW.comment2, 1, 64));
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'comment3', OLD.comment3, NEW.comment3);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'id_barcode2', OLD.id_barcode2, NEW.id_barcode2);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'consumed', OLD.consumed, NEW.consumed);
        call proc_audititems(NEW.id, NEW.name_last_updated, 'update', 'errorflag', OLD.errorflag, NEW.errorflag);
    END //

delimiter ;
