# Consulta 1.3 clientes. 
select count(table_name)
from information_schema.tables 
where table_schema= 'mysql';

# Consulta esquema biblio. 
USE biblio;

SELECT TABLE_NAME
FROM information_schema.TABLES 
WHERE table_schema= 'biblio';

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_SCHEMA = 'biblio'
AND TABLE_NAME = 'autor';

SELECT *
FROM empleado;

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_SCHEMA = 'personal'
AND TABLE_NAME = 'empleado';