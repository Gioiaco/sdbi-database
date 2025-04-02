SELECT b.Codice_PNR,
       s_partenza_iniziale.Nome_Stazione AS Stazione_Partenza_Iniziale,
       s_arrivo_finale.Nome_Stazione AS Stazione_Arrivo_Finale,
       c_iniziale.Data_Ora_Partenza AS Partenza_Iniziale,
       c_finale.Data_Ora_Arrivo AS Arrivo_Finale,
       ca.Ordine_Cambio,
       s_cambio.Nome_Stazione AS Stazione_Cambio,
       ca.Orario_Arrivo_Precedente,
       ca.Orario_Partenza_Successivo,
       c_cambio_partenza.Data_Ora_Partenza AS Partenza_Cambio,
       c_cambio_arrivo.Data_Ora_Arrivo AS Arrivo_Cambio
FROM Biglietti b
JOIN Corse c_iniziale ON b.Corsa_ID = c_iniziale.ID_Corsa
JOIN Tratte t_iniziale ON c_iniziale.Tratta_ID = t_iniziale.ID_Tratta
JOIN Stazioni s_partenza_iniziale ON t_iniziale.Stazione_Partenza_ID = s_partenza_iniziale.ID_Stazione
JOIN Stazioni s_arrivo_finale ON t_iniziale.Stazione_Arrivo_ID = s_arrivo_finale.ID_Stazione
LEFT JOIN Cambi ca ON b.ID_Biglietto = ca.Biglietto_ID
LEFT JOIN Stazioni s_cambio ON ca.Stazione_Cambio_ID = s_cambio.ID_Stazione
LEFT JOIN Corse c_cambio_partenza ON ca.Corsa_Partenza_ID = c_cambio_partenza.ID_Corsa
LEFT JOIN Corse c_cambio_arrivo ON ca.Corsa_Arrivo_ID = c_cambio_arrivo.ID_Corsa
JOIN Corse c_finale ON (ca.Ordine_Cambio IS NULL AND b.Corsa_ID = c_finale.ID_Corsa) OR (ca.Ordine_Cambio IS NOT NULL AND ca.Corsa_Arrivo_ID = c_finale.ID_Corsa)
WHERE b.Codice_PNR = 'EFG789';
