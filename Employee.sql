CREATE TABLE departments (
    Dept_no INT NOT NULL,
    dept_name VARCHAR NOT NULL,
    PRIMARY KEY (Dept_no)
);

CREATE TABLE dept_manager (
    emp_no INT NOT NULL,
    dept_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    PRIMARY KEY (dept_no),
    FOREIGN KEY (dept_no) REFERENCES Departments(Dept_no)
);

CREATE TABLE Employees (
    emp_no INT NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    gender VARCHAR NOT NULL,
    hire_date DATE NOT NULL,
    PRIMARY KEY (emp_no)
);

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    PRIMARY KEY (emp_no, dept_no), 
    CONSTRAINT unique_emp_dept_no UNIQUE (emp_no, dept_no) 
);

CREATE TABLE titles (
    emp_no INT NOT NULL,
    title VARCHAR NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    PRIMARY KEY (emp_no, from_date), 
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
    FOREIGN KEY (emp_no, from_date) REFERENCES dept_emp(emp_no, from_date) 
);

ALTER TABLE dept_emp ADD CONSTRAINT unique_emp_from_date UNIQUE (emp_no, from_date);

CREATE TABLE titles (
    emp_no INT NOT NULL,
    title VARCHAR NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    PRIMARY KEY (emp_no, from_date),
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
    FOREIGN KEY (emp_no, from_date) REFERENCES dept_emp(emp_no, from_date)
);
CREATE TABLE Salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    PRIMARY KEY (to_date),
    FOREIGN KEY (emp_no, from_date) REFERENCES titles(emp_no, from_date)
);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES dept_emp(emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments(Dept_no);

ALTER TABLE titles ADD CONSTRAINT fk_titles_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees(emp_no);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees(emp_no);



