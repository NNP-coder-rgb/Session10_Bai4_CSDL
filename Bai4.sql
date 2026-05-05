DROP TABLE IF EXISTS Pharmacy_Inventory;

CREATE TABLE Pharmacy_Inventory (
    Inventory_ID INT AUTO_INCREMENT PRIMARY KEY,
    Drug_Name VARCHAR(255),
    Batch_Number VARCHAR(50),
    Expiry_Date DATE,
    Quantity INT
) ENGINE=InnoDB;

CREATE INDEX idx_drug_name_expiry ON Pharmacy_Inventory(Drug_Name, Expiry_Date);

ALTER TABLE Pharmacy_Inventory ADD FULLTEXT(Drug_Name);

SELECT * 
FROM Pharmacy_Inventory 
WHERE Drug_Name = 'Paracetamol 500mg' 
  AND Expiry_Date >= CURDATE()
ORDER BY Expiry_Date ASC;

SELECT * 
FROM Pharmacy_Inventory 
WHERE MATCH(Drug_Name) AGAINST('Paracetamol' IN NATURAL LANGUAGE MODE)
  AND Expiry_Date < DATE_ADD(CURDATE(), INTERVAL 6 MONTH);

EXPLAIN SELECT * 
FROM Pharmacy_Inventory 
WHERE Drug_Name = 'Aspirin' 
  AND Expiry_Date <= '2026-12-31';
