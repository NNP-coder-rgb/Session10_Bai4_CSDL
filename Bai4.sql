CREATE TABLE Pharmacy_Inventory (
	Inventory_ID INT AUTO_INCREMENT PRIMARY KEY,
	Drug_Name VARCHAR(255),
	Batch_Number VARCHAR(50),
	Expiry_Date DATE,
	Quantity INT
);

CREATE INDEX idx_drug_expiry ON Pharmacy_Inventory(Drug_Name, Expiry_Date);

ALTER TABLE Pharmacy_Inventory ADD FULLTEXT(Drug_Name);