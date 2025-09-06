ALTER TABLE brazilian_ecommerce_cleaned 
ADD COLUMN state TEXT;

UPDATE brazilian_ecommerce_cleaned
SET state = CASE geolocation_state_customer
    WHEN 'AL' THEN 'Alagoas'
    WHEN 'AM' THEN 'Amazonas'
    WHEN 'AP' THEN 'Amapá'
    WHEN 'BA' THEN 'Bahia'
    WHEN 'CE' THEN 'Ceará'
    WHEN 'DF' THEN 'Distrito Federal'
    WHEN 'ES' THEN 'Espírito Santo'
    WHEN 'GO' THEN 'Goiás'
    WHEN 'MA' THEN 'Maranhão'
    WHEN 'MG' THEN 'Minas Gerais'
    WHEN 'MS' THEN 'Mato Grosso do Sul'
    WHEN 'MT' THEN 'Mato Grosso'
    WHEN 'PA' THEN 'Pará'
    WHEN 'PB' THEN 'Paraíba'
    WHEN 'PE' THEN 'Pernambuco'
    WHEN 'PI' THEN 'Piauí'
    WHEN 'PR' THEN 'Paraná'
    WHEN 'RJ' THEN 'Rio de Janeiro'
    WHEN 'RN' THEN 'Rio Grande do Norte'
    WHEN 'RO' THEN 'Rondônia'
    WHEN 'RS' THEN 'Rio Grande do Sul'
    WHEN 'SC' THEN 'Santa Catarina'
    WHEN 'SE' THEN 'Sergipe'
    WHEN 'SP' THEN 'São Paulo'
    WHEN 'TO' THEN 'Tocantins'
    ELSE geolocation_state_customer
END;


ALTER TABLE brazilian_ecommerce_cleaned 
ALTER COLUMN geolocation_state_customer TYPE VARCHAR(50);

UPDATE brazilian_ecommerce_cleaned
SET geolocation_state_customer = CASE geolocation_state_customer
    WHEN 'AL' THEN 'Alagoas'
    WHEN 'AM' THEN 'Amazonas'
    WHEN 'AP' THEN 'Amapá'
    WHEN 'BA' THEN 'Bahia'
    WHEN 'CE' THEN 'Ceará'
    WHEN 'DF' THEN 'Distrito Federal'
    WHEN 'ES' THEN 'Espírito Santo'
    WHEN 'GO' THEN 'Goiás'
    WHEN 'MA' THEN 'Maranhão'
    WHEN 'MG' THEN 'Minas Gerais'
    WHEN 'MS' THEN 'Mato Grosso do Sul'
    WHEN 'MT' THEN 'Mato Grosso'
    WHEN 'PA' THEN 'Pará'
    WHEN 'PB' THEN 'Paraíba'
    WHEN 'PE' THEN 'Pernambuco'
    WHEN 'PI' THEN 'Piauí'
    WHEN 'PR' THEN 'Paraná'
    WHEN 'RJ' THEN 'Rio de Janeiro'
    WHEN 'RN' THEN 'Rio Grande do Norte'
    WHEN 'RO' THEN 'Rondônia'
    WHEN 'RS' THEN 'Rio Grande do Sul'
    WHEN 'SC' THEN 'Santa Catarina'
    WHEN 'SE' THEN 'Sergipe'
    WHEN 'SP' THEN 'São Paulo'
    WHEN 'TO' THEN 'Tocantins'
    ELSE geolocation_state_customer
END;
