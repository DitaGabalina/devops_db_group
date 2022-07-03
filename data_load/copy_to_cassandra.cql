
TRUNCATE ur.register_name_history ;
-- Insert some data
COPY ur.register_name_history (regcode,date_to,name) FROM './register_name_history.csv' WITH HEADER = TRUE AND DELIMITER=';' and DATETIMEFORMAT='%Y-%m-%d';