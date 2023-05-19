--schema


CREATE TABLE  departments(
    dept_no integer NOT NULL,
    dept_name varchar (30) NOT NULL,
    PRIMARY KEY (dept_no)
);

CREATE TABLE titles (
    title_id varchar NOT NULL,
    title varchar (30) NOT NULL,
    PRIMARY KEY (title_id)
);

CREATE TABLE employees (
    emp_no integer NOT NULL,
    emp_title_id varchar NOT NULL,
    birth_date date NOT NULL,
    first_name varchar (30) NOT NULL,
    last_name varchar (30) NOT NULL,
    sex char (1) NOT NULL,
    hire_date date NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);


CREATE TABLE salaries (
    emp_no integer NOT NULL,
    salary integer NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

DROP TABLE dept_emp
CREATE TABLE dept_emp (
    emp_no integer NOT NULL,
    dept_no varchar NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no) 
);

DROP TABLE dept_manager
CREATE TABLE dept_manager (
    dept_no varchar NOT NULL,
    emp_no integer NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);



    