/*
Toate rezolvările se vor face sub forma de cod T-SQL (script T-SQL).

	 Se dă baza de date Universitate :
Orase
	- Id
	- Denumire
Grupa
	- Id
	- Denumire
Student
	- Id
	- Grupa la care aparține
	- Orașul de resedință
	- Nume
	- Prenume
Materie
	- Id
	- Nume
Note
	- Id
	- Student
	- Materia
	- Nota obținută

Coloanele Id sunt de tip identity, încep de la 1 și pasul este de 1.
Coloanele de tip string trebuie să suporte stocarea datelor cu caractere speciale.

*/

-- 1. Să se creeze baza de date "Universitate" cu collate-ul SQL_Romanian_CP1250_CS_AS

IF DB_ID (N'Universitate') IS NOT NULL
USE [master]
GO
ALTER DATABASE Universitate SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
USE [master]
GO
DROP DATABASE Universitate
GO
CREATE DATABASE Universitate COLLATE SQL_Romanian_CP1250_CS_AS;;
GO

-- 2. Să se creeze tabelele din baza "Universitate".
USE Universitate
GO
DROP TABLE IF EXISTS Orase;
CREATE TABLE Orase
(  Id int IDENTITY(1,1) PRIMARY KEY,  
	Denumire NVARCHAR(50) NOT NULL
); 

DROP TABLE IF EXISTS Grupa;
CREATE TABLE Grupa
(  Id int IDENTITY(1,1) PRIMARY KEY,  
	Denumire NVARCHAR NOT NULL
);

DROP TABLE IF EXISTS Student;
CREATE TABLE Student
(  Id int IDENTITY(1,1) PRIMARY KEY,  
	Nume NVARCHAR(50) NOT NULL,
	Prenume NVARCHAR(50) NOT NULL, 
	Grupa int FOREIGN KEY REFERENCES Grupa(Id),
  	Oras INT FOREIGN KEY REFERENCES Orase(Id)
);

DROP TABLE IF EXISTS Materie;
CREATE TABLE Materie
(  Id int IDENTITY(1,1) PRIMARY KEY,  
	Nume NVARCHAR(50) NOT NULL
); 

DROP TABLE IF EXISTS Note;
CREATE TABLE Note
(  Id int IDENTITY(1,1) PRIMARY KEY,  
	Student INT FOREIGN KEY REFERENCES Student(Id) ON DELETE CASCADE,
	Materie INT FOREIGN KEY REFERENCES Materie(Id),
	Nota int NOT NULL

);


-- 3. Să se realizeze integritatea bazei de date prin crearea de constrângeri pentru cele 4 relații prezentate.

-- 4. Să se introducă în baza de date următoarele informații:
INSERT INTO Orase
VALUES (N'Ploiești' ),
(N'Pitești'),
(N'Constanța'),
(N'București'),
(N'Călărași'),
(N'Iași'),
(N'Slobozia'),
(N'Sibiu'),
(N'Cluj-Napoca'),
(N'Brașov'),
(N'Fetești'),
(N'Satu-Mare'),
(N'Oradea'),
(N'Cernavodă')
;

INSERT INTO Grupa
VALUES (N'A' ),
(N'B' ),
(N'C' ),
(N'D' );

INSERT INTO Materie
VALUES (N'Geometrie'),
(N'Chimie'),
(N'Algebră'),
(N'Statistică'),
(N'Trigonometrie'),
(N'Muzică'),
(N'Desen'),
(N'Sport'),
(N'Filozofie'),
(N'Literatură'),
(N'Engleză'),
(N'Fizică'),
(N'Franceză');

INSERT INTO Student
VALUES (N'Popescu', N'Mihai', 1,1),
 (N'Ionescu', N'Andrei', 1,4),
 (N'Ionescu', N'Andreea', 1,3),
 (N'Dinu', N'Nicolae', 1,6),

 (N'Constantin', N'Ionut', 2,14),
 (N'Simion', N'Mihai', 2,6),
 (N'Constantinescu', N'Ana-Maria', 2,14),
 (N'Amăriuței', N'Eugen', 2,6),
 (N'Știrbei', N'Alexandru', 2,8),

 (N'Dumitru', N'Angela', 3,10),
(N'Dumitrache', N'Ion', 3,13),
(N'Șerban', N'Maria-Magdalena', 3,13),
(N'Chelaru', N'Violeta', 3,9),
(N'Sandu', N'Daniel', 3,9),

(N'Marinache', N'Alin', 4,12),
(N'Panait', N'Vasile', 4,12),
(N'Popa', N'Mirela', 4, 11),
(N'Dascălu', N'Daniel Ștefan', 4,11),
(N'Georgescu', N'Marian', 4,11),
(N'Dumitrașcu', N'Marius', 4,1),
(N'Dinu', N'Ionela', 4,4)

;

INSERT INTO Note
VALUES (1,2,7),
 (1,12,4),
 (1,13,7),
 (1,12,6),

 (2,3,5),
 (2,4,9),
 (2,6,6),
 (2,12,6),
 (2,2,10),
 (2,8,8),

 (3,8,1),
 (3,10,2),
 (3,13,9),
 (3,8,5),
 (3,10,4),
 (3,10,7),

 (4,2,8),
 (4,3,9),
 (4,4,10),
 
 (5,3,10),
 (5,8,10),
 (5,12,8),

 (6,12,8),
 (6,3,8),
 (6,8,3),
  (6,8,3),
 (6,8,1),
 (6,8,1),

  (7,8,5),
  (7,12,8),
  (7,3,2),
  (7,3,5),

 (8,3,6),
 (8,8,10),
 (8,13,7),


 (9,2,9),
 (9,12,2),
 (9,8,1),
 (9,12,2),
 (9,12,5),
 (9,8,6),

 (10,7,9),
 (10,9,7),
 (10,11,9),

 (11,7,8),
 (11,4,2),
 (11,9,7),
 (11,4,6),

 (12,11,7),
 (12,9,4),
 (12,7,8),
 (12,9,4),
 (12,9,4),

 (13,13,1),
 (13,7,3),
 (13,11,10),
 (13,13,6),
 (13,7,1),

 (14,7,3),
 (14,9,9),
 (14,13,4),
 (14,7,8),
 (14,13,5),

 (15,7,7),
 (15,12,8),
 (15,11,5),

 (16,8,5),
 (16,7,7),
 (16,4,10),
 (16,12,8),
 (16,10,6),
 (16,9,9),

 (17,11,3),
 (17,9,6),
 (17,7,6),
 (17,11,6),

 (18,12,4),
 (18,13,9),
 (18,4,10),
 (18,12,2),
 (18,12,1),
 (18,12,3),
 (18,12,5),

 (19,13,10),
 (19,11,10),
 (19,12,8),

 (20,8,5),
 (20,3,6),
 (20,2,2),
 (20,2,2),
 (20,2,5),

 (21,6,9),
 (21,10,8),
 (21,8,8)
 ;

/*
Orașe:
Ploiești 
Pitești 
Constanța
București
Călărași 
Iași 
Slobozia 
Sibiu 
Cluj-Napoca 
Brașov 
Fetești 
Satu-Mare 
Oradea 
Cernavodă 

Grupe:
A
B
C
D


Materii:
Geometrie 
Algebră 
Statistică 
Trigonometrie 
Muzică 
Desen 
Sport 
Filozofie 
Literatură 
Engleză 
Fizică 
Franceză


Studenți și note:
Numele + prenumele, grupa la care aparține, orașul de resedință

		Student															Note								|				
																											|
Popescu	Mihai, grupa A, Ploiești					Chimie	 7			Fizică		4		Franceză	7	|	Fizică 6
Ionescu	Andrei, grupa A, București					Algebră	 5			Statistică	9		Muzică		6	|	Fizică 9, Chimie 10, Sport 8
Ionescu	Andreea, grupa A, Constanța					Sport	 1			Literatură	2		Franceză	9	|	Sport 5, Literatură 4, Literatură 7
Dinu Nicolae, grupa A, Călărași						Chimie	 8			Algebră		9		Statistică	10	|

															 												|
Constantin Ionuț, grupa B, Cernavodă				Algebră	 10			Sport		10		Fizică		8	|
Simion Mihai, grupa B, Iași							Fizică	 8			Algebră		8		Sport		3	|	Sport 3, Sport 1, Sport 1
Constantinescu Ana-Maria, grupa B, Cernavodă		Sport	 5			Fizică		8		Algebră		2	|	Algebră 5
Amăriuței Eugen, grupa B, Iași						Algebră	 6			Sport		10		Franceză	7	|	
Știrbei	Alexandru, grupa B, Sibiu					Chimie	 9			Fizică		2		Sport		1	|	Fizică 2, Fizică 5, Sport 6
															 												|
Dumitru	Angela, grupa C, Brașov						Desen	 9			Filozofie	7		Engleză		9	|
Dumitrache Ion, grupa C, Oradea						Desen	 8			Statistică	2		Filozofie	7	|	Statistică 6
Șerban Maria-Magdalena, grupa C, Oradea				Engleză	 7			Filozofie	4		Desen		8	|	Filozofie 4, Filozofie 4
Chelaru	Violeta, grupa C, Cluj-Napoca 				Franceză 1			Desen		3		Engleză		10	|	Franceză 6, Desen 1
Sandu Daniel, grupa C, Cluj-Napoca 					Desen	 3			Filozofie	9		Franceză	4	|	Desen 8, Franceză 5
															 												|
Marinache Alin, grupa D, Satu-Mare					Desen	 7			Fizică		8		Engleză		5	|
Panait Vasile, grupa D, Satu-Mare 					Sport	 5			Desen		7		Statistică	10	|	Fizică 8, Literatură 6, Filozofie 9
Popa Mirela, grupa D, Fetești						Engleză	 3			Filozofie	6		Desen		6	|	Engleză	6
Dascălu Daniel Ștefan, grupa D, Fetești				Fizică	 4			Franceză	9		Statistică	10	|	Fizică 2, Fizică 1, Fizică 3, Fizică 5
Georgescu Marian, grupa D, Fetești					Franceză 10			Engleză		10		Fizică		8	|
Dumitrașcu Marius, grupa D, Ploiești				Sport	 5			Algebră		6		Chimie		2	|	Chimie 2, Chimie 5	
Dinu Ionela, grupa D, București						Muzică	 9			Literatură	8		Sport		8	|

 ** Notele se introduc în ordinea din listă, ultima înregistrare reprezentând situația curentă la materia respectivă.
 
*/

-- 5. Să se afișeze numărul de orașe din provincie.
select COUNT(*) from Orase where Denumire NOT LIKE N'București' ;

-- 6. Să se afișeze numărul de materii la care s-au susținut examene.
-- nu inteleg intrebarea 

SELECT APPROX_COUNT_DISTINCT(Materie.Id)
FROM Materie
INNER JOIN Note
ON Materie.Id = Note.Materie;

-- 7. Să se afișeze studenții în ordine alfabetică.

SELECT * FROM Student ORDER BY Nume;

-- 8. Să se afișeze studenții cu 2 prenume (prenumele conține caracterul blanc sau - ( liniuță) ).

SELECT * FROM Student WHERE Prenume LIKE '%-%' OR Prenume LIKE '% %';

-- 9. Să se afișeze studenții din provincie.

SELECT * FROM Student S WHERE S.Oras != (SELECT Id FROM Orase WHERE Denumire=N'București');

-- 10. Să se afișeze orașele care nu au nici un student încris.

SELECT Denumire FROM Orase 
LEFT  JOIN Student
ON Orase.Id = Student.Oras
WHERE Student.Oras IS NULL;

-- 11. Să se afișeze grupele care au cel puțin 5 studenți.

SELECT Grupa.Denumire, COUNT(Student.Grupa) STUDENTI FROM Grupa
INNER JOIN Student
ON Grupa.Id = Student.Grupa
GROUP BY Grupa.Denumire
HAVING COUNT(Student.Grupa) >=5

-- 12. Să se afișeze numele grupei care are cei mai mulți studenți.

SELECT TOP 1 Y.DENUMIRE ,MAX(Y.STUDENTI) FROM 
 (SELECT Grupa.Denumire DENUMIRE, COUNT(Student.Grupa) AS STUDENTI FROM Grupa
INNER JOIN Student
ON Grupa.Id = Student.Grupa
GROUP BY Grupa.Denumire
) Y
GROUP BY Y.DENUMIRE
ORDER BY MAX(Y.STUDENTI) DESC

-- 13. Să se afișeze materiile la care nu s-a dat niciodată examen.
SELECT * FROM Materie 
LEFT  JOIN Note
ON Materie.Id = Note.Materie
WHERE Note.Materie IS NULL;

-- 14. Să se afișeze studenții care au urmat și cursuri opționale ( au notă la mai mult de 3 materii ).

SELECT Student.Id, Student.Nume, Student.Prenume FROM Student
INNER JOIN Note
ON Student.Id = Note.Student 
GROUP BY Student.Id, Student.Nume, Student.Prenume
HAVING COUNT(Note.Id)>3;

-- 15. Să se calculeze media generală a fiecărui student ( vezi ** ).
select max(Note.Id) maxim into #temp_note
 from Note
group by Note.Student, Note.Materie

SELECT s.Id, AVG(CAST(n.Nota AS FLOAT)) medie_generala, s.Nume, s.Prenume into #temp_avg from
Student s, Note n, #temp_note temp
where n.Student=s.Id and temp.maxim=n.Id 
group by s.Id, s.Nume, s.Prenume

SELECT * FROM #temp_avg

-- 16. Să se afișeze grupa care are media generală cea mai mare.
SELECT MAX(Y.MEDIE) FROM 
(SELECT AVG(medie_generala) AS MEDIE FROM Student S
INNER JOIN #temp_avg A
ON S.Id=A.Id
GROUP BY S.Grupa
) Y

-- 17. Să se afișeze studenții bursieri ( care au media generală cel puțin 8,50 ).

SELECT * FROM #temp_avg 
WHERE medie_generala>=8.5

-- 18. Să se afișeze studenții care nu au promovat materia "Chimie" de la prima examinare, dar au promovat ulterior.

SELECT S.Id,S.Nume, S.Prenume, MIN(Y.Nota), MAX(Y.Nota) FROM Student S, 
(SELECT N.Nota, N.Student FROM Note N, Materie M
WHERE N.Materie=M.Id AND M.Nume LIKE 'Chimie'
) Y
WHERE S.Id=Y.Student
GROUP BY S.Id,S.Nume, S.Prenume
HAVING MIN(Y.Nota)<5 AND MAX(Y.Nota)>=5

-- 19. Să se afișeze studentul care a susținut cele mai multe examinări la aceeași materie.

SELECT TOP 1 S.Id, S.Nume, S.Prenume, Y.Materie, MAX(Y.NOTE) AS EXAMINARI FROM Student S, 
(SELECT  N.Student Student, N.Materie, COUNT(N.Nota) AS NOTE FROM Note N, Materie M
WHERE N.Materie=M.Id
GROUP BY N.Student, N.Materie
) Y
WHERE S.Id=Y.Student
GROUP BY S.Id, S.Nume, S.Prenume, Y.Materie
ORDER BY MAX(Y.NOTE) DESC
-- 20. Să se afișeze studenții și numărul de examinări la fiecare materie în parte.

SELECT  S.Id, S.Nume, S.Prenume, M.Nume, COUNT(N.Nota) AS EXAMINARI FROM Note N, Materie M, Student S
WHERE N.Materie=M.Id AND S.Id=N.Student
GROUP BY S.Id,S.Nume, S.Prenume, N.Materie, M.Nume

-- 21. Să se afișeze studenții repetenți (au picat cel puțin o materie ).
SELECT S.Id,S.Nume,S.Prenume INTO #TEMP_REPETENTI FROM Student S, Note N, #temp_note T 
WHERE S.Id=N.Student AND N.Id=T.maxim
GROUP BY S.Id,S.Nume,S.Prenume 
HAVING MIN(N.Nota)<5

SELECT * FROM #TEMP_REPETENTI

-- 22. Să se mute toți repetenții într-o grupă nouă, grupa E. ( vezi pct. anterior)

INSERT INTO Grupa
VALUES (N'E' );

UPDATE Student SET Grupa=(SELECT Grupa.Id FROM Grupa WHERE Grupa.Denumire=N'E') 
FROM Student
    INNER JOIN #TEMP_REPETENTI
    ON (Student.Id=#TEMP_REPETENTI.Id);  

-- 23. Cel mai slab student este exmatriculat. Să se șteargă studentul din baza de date.

DELETE FROM Student WHERE Student.Id = (
SELECT TOP 1 T.Id FROM #temp_avg T
INNER JOIN #TEMP_REPETENTI S
ON S.Id=T.Id
ORDER BY T.medie_generala
)

-- 24. Să se afișeze toți studenții care fac parte din aceeași familie ( au același nume de familie ), după modelul:
/*
	Nume		Prenume
	Ionescu		Andrei
	Ionescu		Andreea

	Rezultat afișat:

	Familia		Frații
	Ionescu		Andrei, Andreea
*/

SELECT S1.Nume AS FAMILIA, STRING_AGG(S1.Prenume, ', ') AS FRATII FROM Student S1, Student S2
WHERE S1.Nume = S2.Nume AND S1.Id != S2.Id
GROUP BY S1.Nume