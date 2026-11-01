-- seccion 6

USE BIBLIOTECA;

DELIMITER //

CREATE PROCEDURE SP_REGISTRAR_PRESTAMO(
    IN p_RUT_EST VARCHAR(15),
    IN p_COD_LIBRO INT,
    IN p_RUT_FUNC VARCHAR(15),
    IN p_FECHA_P DATE
)
BEGIN
    IF EXISTS (
        SELECT 1
        FROM PRESTAMO
        WHERE RUT_EST = p_RUT_EST
          AND COD_LIBRO = p_COD_LIBRO
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
            'El estudiante ya tiene registrado este libro';
    ELSE
        INSERT INTO PRESTAMO
            (RUT_EST, RUT_FUNC, COD_LIBRO, FECHA_P, FECHA_E)
        VALUES
            (p_RUT_EST, p_RUT_FUNC, p_COD_LIBRO,
             p_FECHA_P, DATE_ADD(p_FECHA_P, INTERVAL 7 DAY));

        SELECT 'Préstamo registrado correctamente' AS MENSAJE;
    END IF;
END //

DELIMITER ;


CALL SP_REGISTRAR_PRESTAMO(
    'E006', 102, 'F001', '2026-10-27'
);

SELECT *
FROM PRESTAMO
WHERE RUT_EST = 'E006'
  AND COD_LIBRO = 102;


  