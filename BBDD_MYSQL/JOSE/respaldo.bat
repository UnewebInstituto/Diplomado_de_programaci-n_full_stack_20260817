echo Ejecutar la siguiente linea en la terminal de command prompt
echo Realiza un respaldo de la base de datos db_jose
echo La guarda en el directorio ./respaldo

"C:\xampp\mysql\bin\mysqldump" -u root -p db_jose > ./respaldos/db_jose_20260918.sql