CREATE TYPE sexo AS ENUM('M','F','O');

CREATE TABLE person IF NOT EXISTS(
	 person_id   serial
	,fname       varchar(20)
	,lname       varchar(20)
	,gender      sexo
	,birth_date  date
	,street      varchar(20)
	,city        varchar(20)
	,state       varchar(20)
	,country     varchar(20)
	,postal_code varchar(20)
	,CONSTRAINT pk_person PRIMARY KEY (person_id)
);

CREATE TABLE favorite_food IF NOT EXISTS(
	 person_id  serial
	,food       varchar(20)
	,CONSTRAINT pk_favorite_food PRIMARY KEY (person_id, food)
	,CONSTRAINT fk_favorite_food_person_id 
		FOREIGN KEY (person_id) REFERENCES person(person_id)
);

SELECT * FROM information_schema.table_constraints 
WHERE table_name = 'person';

SELECT * FROM information_schema.table_constraints 
WHERE constraint_schema  = 'dio';

INSERT INTO person VALUES ('1','Carolina','Silva','F','1979-08-21',
							'rua tal','cidade J','RJ','Brasil','26054-89');

INSERT INTO person VALUES ('2','Adevan','Neves','M','2003-03-13',
							'rua tal','cidade J','AM','Brasil','26154-89'),
							('3','Roberta','OP','F','2018-07-29',
							'rua fulano de tal','cidade A','SP','Brasil','96054-89');
						
			
SELECT * FROM person;

DELETE FROM person WHERE person_id = 2 or person_id = 4;

SELECT * FROM person;

INSERT INTO favorite_food VALUES ('19','lasanha'); //erro não existe 19 em person

INSERT INTO favorite_food VALUES ('1','pizza');

SELECT * FROM favorite_food;

INSERT INTO favorite_food VALUES ('3','macarronada'),
								 ('3','churrasco');
							
SELECT * FROM favorite_food;
