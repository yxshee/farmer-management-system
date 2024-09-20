CREATE TRIGGER after_insert_register
AFTER INSERT ON register
FOR EACH ROW
BEGIN
    INSERT INTO trig (fid, action) VALUES (NEW.rid, 'FARMER INSERTED');
END;

CREATE TRIGGER after_delete_register
AFTER DELETE ON register
FOR EACH ROW
BEGIN
    INSERT INTO trig (fid, action) VALUES (OLD.rid, 'FARMER DELETED');
END;

CREATE TRIGGER after_update_register
AFTER UPDATE ON register
FOR EACH ROW
BEGIN
    INSERT INTO trig (fid, action) VALUES (NEW.rid, 'FARMER UPDATED');
END;
