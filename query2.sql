SELECT b.Codice_PNR, s_partenza.Nome_Stazione AS Stazione_Partenza, s_arrivo.Nome_Stazione AS Stazione_Arrivo, c.Data_Ora_Partenza, c.Data_Ora_Arrivo, b.Prezzo
FROM Biglietti b
JOIN Corse c ON b.Corsa_ID = c.ID_Corsa
JOIN Tratte t ON c.Tratta_ID = t.ID_Tratta
JOIN Stazioni s_partenza ON t.Stazione_Partenza_ID = s_partenza.ID_Stazione
JOIN Stazioni s_arrivo ON t.Stazione_Arrivo_ID = s_arrivo.ID_Stazione
JOIN Passeggeri p ON b.Passeggero_ID = p.ID_Passeggero
WHERE p.Email = 'bob.bianchi@email.com'
ORDER BY b.Data_Ora_Acquisto DESC;
