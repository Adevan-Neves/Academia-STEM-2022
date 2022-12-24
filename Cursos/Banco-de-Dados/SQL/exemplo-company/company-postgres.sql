CREATE TABLE employee (
	 Fname     varchar(15) NOT NULL
	,Minit     char
	,Lname     varchar(15) NOT NULL
	,Ssn       char(9)
	,Bdate     date
	,Adress    varchar(30)
	,sex       char
	,Salary    decimal(10,2)
	,Super_ssn char(9)
	,Dno int NOT NULL
	,PRIMARY KEY (Ssn)
);

CREATE TABLE departament(
	 Dname          varchar(15) NOT NULL
	,Dnumber        int NOT NULL
	,Mgr_ssn        char(9)
	,Mgr_start_date date
	,PRIMARY KEY (Dnumber)
	,UNIQUE (Dname)
	,FOREIGN KEY (Mgr_ssn) REFERENCES employee(Ssn)
);

CREATE TABLE dept_locations(
	 Dnumber      int NOT NULL
	,Dlocation    varchar(15) NOT NULL
	,PRIMARY KEY (Dnumber,Dlocation)
	,FOREIGN KEY (Dnumber) REFERENCES departament(Dnumber)
)

CREATE TABLE project (
	 Pname         varchar(15)  NOT NULL
	,Pnumber       int NOT NULL
	,Plocation     varchar(15)
	,Dnumber       int NOT NULL
	,PRIMARY KEY (Pnumber)
	,UNIQUE (Pname)
	,FOREIGN KEY (Dnumber) REFERENCES departament(Dnumber)
);

CREATE TABLE works_on(
	 Essn        char(9) NOT NULL
	,Pno         int NOT NULL
	,Hours       decimal(3,1) NOT NULL
	,PRIMARY KEY (Essn,Pno)
	,FOREIGN KEY (Essn) REFERENCES employee(Ssn)
	,FOREIGN KEY (Pno) REFERENCES project(Pnumber)
);

CREATE TABLE dependent(
	 Essn           char(9) NOT NULL
	,Dependent_name varchar(15)
	,Sex            char -- F ou M
	,Relationship   varchar(8)
	,PRIMARY KEY (Essn,Dependent_name)
	,FOREIGN KEY (Essn) REFERENCES employee(Ssn)
);