# Pharmaceutical-Store-Design

Problem statement.  Your consulting company has been asked to develop a relational database design for a growing drug store chain. You gather the following information:
	Each patient has an identifying SSN, plus a name, age, and address.
	Doctors also have an identifying SSN. Additionally, each doctor has a name, a specialty, and a number of years of experience.
	Each pharmaceutical company is identified by name and has a phone number.
	Each drug has a trade name and a formula.  Each drug is sold by a given pharmaceutical company, and the trade name identifies a drug uniquely from among the products of that company. If a pharmaceutical company is deleted, you need not keep track of its products any longer.
	Each pharmacy has a name, address, and phone number.
	Every patient has a primary physician. Every doctor has at least one patient.
	Each pharmacy sells several drugs and has a price for each. A drug could be sold at several pharmacies, and the price could vary from one pharmacy to another.
	Doctors prescribe drugs for patients. A doctor could prescribe one or more drugs for several patients, and a patient could obtain prescriptions from several doctors.
	Each prescription has a date and a quantity associated with it. You can assume that, if a doctor prescribes the same drug for the same patient more than once, only the last such prescription needs to be stored.
	Pharmaceutical companies have long-term contracts with pharmacies. A pharmaceutical company can contract with several pharmacies, and a pharmacy can contract with several pharmaceutical companies. For each contract, you have to store a start date, an end date, and the text of the contract.
	Pharmacies appoint a supervisor for each contract. There must always be a supervisor for each contract, but the contract supervisor can change over the lifetime of the contract.
