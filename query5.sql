SELECT COUNT(b.ID_Biglietto) AS Numero_BigliettiVenduti
FROM Biglietti b
JOIN Corse c ON b.Corsa_ID = c.ID_Corsa
JOIN Tratte t ON c.Tratta_ID = t.ID_Tratta
WHERE t.Stazione_Partenza_ID = (SELECT ID_Stazione FROM Stazioni WHERE Nome_Stazione = 'Roma Termini')
  AND t.Stazione_Arrivo_ID = (SELECT ID_Stazione FROM Stazioni WHERE Nome_Stazione = 'Milano Centrale')
  AND c.Data_Ora_Partenza BETWEEN '2025-04-01' AND '2025-04-30';
