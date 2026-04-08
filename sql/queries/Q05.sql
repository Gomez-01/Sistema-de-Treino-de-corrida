SELECT 
    id_cronograma, 
    semana_ref, 
    meta_km, 
    descricao 
FROM cronogramas
WHERE semana_ref >= date_trunc('week', CURRENT_DATE) 
AND semana_ref < date_trunc('week', CURRENT_DATE) + INTERVAL '7 days';

SELECT * FROM alunos