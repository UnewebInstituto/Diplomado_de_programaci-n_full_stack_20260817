echo El siguiente archivo se ejecuta desde command prompt
echo y realiza un respaldo de la base de datos db_profesor 
echo en el directorio ./respaldos

"C:\xampp\mysql\bin\mysqldump" -u root -p db_profesor > ./respaldos/db_profesor_20260921.sql