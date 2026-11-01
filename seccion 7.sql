-- seccion 7 ej1
CREATE USER 'bibliotecario_user'@'localhost'
IDENTIFIED BY 'Biblio_Segura2026!';

-- ej2
GRANT SELECT ON BIBLIOTECA.LIBROS
TO 'bibliotecario_user'@'localhost';

GRANT SELECT ON BIBLIOTECA.AUTORES
TO 'bibliotecario_user'@'localhost';

GRANT SELECT ON BIBLIOTECA.EDITORIALES
TO 'bibliotecario_user'@'localhost';

-- ej3
GRANT SELECT, INSERT, UPDATE, DELETE
ON BIBLIOTECA.PRESTAMO
TO 'bibliotecario_user'@'localhost';

-- ej4
CREATE USER 'admin_user'@'localhost'
IDENTIFIED BY 'Admin_Biblioteca2026!';

GRANT ALL PRIVILEGES
ON BIBLIOTECA.*
TO 'admin_user'@'localhost';

-- ej5
REVOKE DELETE
ON BIBLIOTECA.PRESTAMO
FROM 'bibliotecario_user'@'localhost';

-- compropacion de los permisos
SHOW GRANTS FOR 'bibliotecario_user'@'localhost';

SHOW GRANTS FOR 'admin_user'@'localhost';