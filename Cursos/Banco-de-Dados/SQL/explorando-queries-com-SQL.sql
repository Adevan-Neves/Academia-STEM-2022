-- Recolhendo o valor do inss
SELECT Fname,Lname,
       Salary,
       Salary*0.11 AS INSS 
            FROM employee;

-- definir um aumento de salário 
-- para os gerentes que trabalham 
-- no projeto associado ao produtoX
SELECT 
     CONCAT(Fname,' ',Lname) AS Complete_name
    ,Salary
    ,Salary*1.1 AS incresead_salary 
    
    FROM 
    employee e, works_on AS w, project p

    WHERE ( e.Ssn   = w.Essn 
        AND w.Pno   = p.Pnumber
        AND p.Pname = 'ProductX');

-- Listando os atributos dos funcionários que trabalham no departamento de pesquisa
SELECT e.Fname, e.iname, e.Adress 
FROM   employee e, departament d
WHERE  d.Dname = 'Research' and d.Dnumber = e.Dno;

-- Listando os atributos dos funcionários do departamento 5 que ganham salário entre 30000 e 40000
SELECT *
FROM   employee
WHERE  (Salary BETWEEN 30000 AND 40000) AND Dno = 5;

-- Recuperando informações dos departamentos presentes em Stafford
SELECT Dname as Departament_Name, Mgr_ssn as Manager, Address
FROM   departament d, dept_locations l, employee e
WHERE  d.DNumber = l.Dnumber AND Dlocation = 'Stafford';

--Recuperando todos os gerentes que trabalham em Stafford
SELECT Dname as Departament_Name, Mgr_ssn as Manager,concat(Fname,' ',Lname) as Complete_name
FROM   departament d, dept_locations l, employee e
WHERE  d.DNumber = l.Dnumber AND Dlocation = 'Stafford' and Mgr_ssn = e.Ssn;

--Recuperando todos os gerentes, departamentos e seus nomes 
SELECT Dname as Departament_Name, Mgr_ssn as Manager,concat(Fname,' ',Lname),Dlocation
FROM   departament d, dept_locations l, employee e
WHERE  d.DNumber = l.Dnumber and Mgr_ssn = e.Ssn;

SELECT CONCAT(Fname,' ',Lname) Complete_name,Dname as Departament_Name
FROM   employee,departament
WHERE  (Dno=Dnumber and Address like '%Houston%');

SELECT Fname,Lname
FROM employee
WHERE (Salary > 30000 and Salary < 40000);

SELECT Bdate,Address
FROM   employee
WHERE  Fname='John' and Lname='Smith';

SELECT *
FROM   departament
WHERE  Dname = 'Research' or Dname = 'Administration';

SELECT CONCAT(Fname,' ',Lname) Complete_name
FROM   employee, departament
WHERE  Dname = 'Research' and DNumber=Dno;

-- Exemplo de Union,Except e Intersect

CREATE DATABASE teste;

CREATE TABLE R(
    A char(2)
);

CREATE TABLE S(
    A char(2)
);

INSERT INTO R(A) VALUES ('a1'),('a2'),('a2'),('a3');
INSERT INTO S(A) VALUES ('a1'),('a1'),('a2'),('a3'),('a4'),('a5');

-- except --> not in
SELECT * FROM S WHERE A not in (SELECT A FROM R);

-- union
(SELECT DISTINCT R.A FROM R)
    UNION (SELECT DISTINCT S.A FROM S);

-- intersect 
SELECT DISTINCT R.A FROM R WHERE R.A in (SELECT S.A FROM S);