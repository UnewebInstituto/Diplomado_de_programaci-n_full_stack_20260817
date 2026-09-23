echo El siguiente archivo se ejecuta desde command prompt
echo y realiza un respaldo de la base de datos db_andres
echo en el directorio ./respaldos  

"C:\xampp\mysql\bin\mysqldump" -u root -p db_andres > ./respaldos/db_andres_20260923.sql